## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.74.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project-services"></a> [project-services](#module\_project-services) | terraform-google-modules/project-factory/google//modules/project_services | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.vm_01](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_folder.test_folder_01](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_service_account.gce_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [random_id.uniq](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_shuffle.zone](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/shuffle) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_apis"></a> [gcp\_apis](#input\_gcp\_apis) | list of APIs to enable in each project | `list(string)` | <pre>[<br>  "bigquery.googleapis.com",<br>  "cloudkms.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "compute.googleapis.com",<br>  "container.googleapis.com",<br>  "dns.googleapis.com",<br>  "iam.googleapis.com",<br>  "logging.googleapis.com",<br>  "pubsub.googleapis.com",<br>  "serviceusage.googleapis.com",<br>  "sqladmin.googleapis.com",<br>  "storage-component.googleapis.com"<br>]</pre> | no |
| <a name="input_gcp_billing_account"></a> [gcp\_billing\_account](#input\_gcp\_billing\_account) | Billing account to use for GCP projects | `string` | `null` | no |
| <a name="input_gcp_org_id"></a> [gcp\_org\_id](#input\_gcp\_org\_id) | Organization ID (numeric) to create resources within | `string` | `null` | no |
| <a name="input_gcp_project_prefix"></a> [gcp\_project\_prefix](#input\_gcp\_project\_prefix) | The prefix to use for every project name generated by this code | `string` | `"lw-test-proj"` | no |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to deploy GCP assets in | `string` | `"us-east1"` | no |
| <a name="input_gcp_region_list"></a> [gcp\_region\_list](#input\_gcp\_region\_list) | List of available regions to deploy assets within | `list(string)` | <pre>[<br>  "us-east1",<br>  "us-central1",<br>  "us-west1"<br>]</pre> | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Default zone to use within gcp\_region | `string` | `"us-east1-b"` | no |
| <a name="input_gcp_zone_list"></a> [gcp\_zone\_list](#input\_gcp\_zone\_list) | List of available zones to deploy assets within | `list(string)` | <pre>[<br>  "us-east1-b",<br>  "us-east1-c",<br>  "us-central1-b",<br>  "us-central1-c",<br>  "us-west1-b",<br>  "us-west1-c"<br>]</pre> | no |
| <a name="input_project_count"></a> [project\_count](#input\_project\_count) | Number of projects to create - start low and build it up gradually unless you know you have enough quota | `number` | `45` | no |

## Outputs

No outputs.
