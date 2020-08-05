terraform {
required_version = ">= 0.12.7"
  backend "gcs" {
    bucket      = "tf-state-taufik"
    prefix      = "terraform/state"
  }
}