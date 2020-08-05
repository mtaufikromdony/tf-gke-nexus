provider "google" {
  version     = "~> 3.32"
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  version     = "~> 3.32"
  project     = var.project_id
  region      = var.region
}