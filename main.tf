// Random ID
resource "random_id" "uniq" {
  byte_length = 4
}


// Create Folder to hold all the projects
resource "google_folder" "test_folder_01" {
  display_name = "Testing ${random_id.uniq.hex}"
  parent = "organizations/${var.gcp_org_id}"
}

// Create Projects
resource "google_project" "project" {
  count = var.project_count
  name = "${var.gcp_project_prefix}-${random_id.uniq.hex}-${format("%02d",count.index)}"
  project_id = "${var.gcp_project_prefix}-${random_id.uniq.hex}-${format("%02d",count.index)}"
  folder_id = google_folder.test_folder_01.name
  billing_account = var.gcp_billing_account
  auto_create_network = true
}

// Enable APIs
module "project-services" {
  for_each = { for project in google_project.project: project.project_id => project }
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  project_id = each.value.project_id
  activate_apis = var.gcp_apis
}

// TODO:  Make resource creations below a module?

// Create deprived service account for GCE instances
resource "google_service_account" "gce_service_account" {
  for_each = { for project in google_project.project: project.project_id => project }
  project = each.value.project_id
  account_id   = "depriv-service-account"
  display_name = "Service Account with no privileges"
}

// Create VMs
resource "random_shuffle" "zone" {
  input = var.gcp_zone_list
  result_count = 1
}

resource "google_compute_instance" "vm_01" {
  for_each = { for project in google_project.project: project.project_id => project }
  project = each.value.project_id
  name = "vm-01"
  machine_type = "e2-micro"
  zone = random_shuffle.zone.result[0]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.gce_service_account[each.value.project_id].email
    scopes = ["cloud-platform"]
  }
}

// Create KMS Keyrings

// Create KMS Keys


