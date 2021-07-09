variable "gcp_org_id" {
  description = "Organization ID (numeric) to create resources within"
  type        = string
  default     = null
}

variable "gcp_region" {
  description = "Region to deploy GCP assets in"
  type        = string
  default     = "us-east1"
}

variable "gcp_zone" {
  description = "Default zone to use within gcp_region"
  type        = string
  default     = "us-east1-b"
}

variable "gcp_project_prefix" {
  description = "The prefix to use for every project name generated by this code"
  type        = string
  default     = "lw-test-proj"
}

variable "gcp_region_list" {
  description = "List of available regions to deploy assets within"
  type        = list(string)
  default = [
    "us-east1",
    "us-central1",
    "us-west1",
  ]
}

variable "gcp_zone_list" {
  description = "List of available zones to deploy assets within"
  type        = list(string)
  default = [
    "us-east1-b",
    "us-east1-c",
    "us-central1-b",
    "us-central1-c",
    "us-west1-b",
    "us-west1-c",
  ]
}

variable "project_count" {
  description = "Number of projects to create - start low and build it up gradually unless you know you have enough quota"
  type        = number
  default     = 10
}

variable "gcp_billing_account" {
  description = "Billing account to use for GCP projects"
  type        = string
  default     = null
}

variable "gcp_apis" {
  description = "list of APIs to enable in each project"
  type        = list(string)
  default = [
    "bigquery.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "serviceusage.googleapis.com",
    "sqladmin.googleapis.com",
    "storage-component.googleapis.com",
  ]
}
