resource "google_compute_network" "vpc_flexion" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "node-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_flexion.id
  secondary_ip_range {
    range_name    = "pod-cidr"
    ip_cidr_range = "192.168.10.0/24"
  }
}