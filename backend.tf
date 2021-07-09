terraform {
  backend "gcs" {
    bucket = "mtothel-terraform-state"
    prefix = "many-much-projects/"
  }
}
