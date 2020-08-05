  # Create a GKE cluster
  resource "google_container_cluster" "gke-cluster" {
    provider                    = google-beta
    name                        = var.name
    location                    = var.region
    initial_node_count          = var.initial_node_count

    master_auth {
      username = ""
      password = ""
    }

    # Enable Workload Identity
    workload_identity_config {
      identity_namespace = "${var.project_id}.svc.id.goog"
    }

    node_config {
      machine_type      = var.machine_type
      disk_size_gb      = var.disk_size_gb
      disk_type         = "pd-standard"
      image_type        = "COS"
      preemptible       = true
      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",

      ]

      metadata = {
        "disable-legacy-endpoints" = "true"
      }

      workload_metadata_config {
        node_metadata = "GKE_METADATA_SERVER"
      }
    }
  }

  resource "google_storage_bucket" "aliz-nexus-bucket" {
  name     = "aliz-nexus-bucket-${var.project_id}"
  location = "Asia"
  }