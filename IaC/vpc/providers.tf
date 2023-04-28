terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.63.1"
    }
  }
}

provider "google" {
  # Configuration options
  project = var.project_id
  region  = var.compute_region
  zone    = var.compute_zone
}