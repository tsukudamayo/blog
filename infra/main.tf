terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}

provider "google-beta" {
  project = var.project
}

resource "google_cloud_run_service" "default" {
  name     = var.service_name
  location = var.region
  project  = var.project

  template {
    spec {
      containers {
        image = var.container_image
        resources {
          limits = {
            "cpu" : "1000m"
            "memory" : "1Gi"
          }
        }
      }
      service_account_name = var.service_account_name
    }
  }
}
