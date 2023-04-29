resource "google_compute_network" "vpc_flexion" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.node_network
  ip_cidr_range = var.node_cidr
  region        = var.compute_region
  network       = google_compute_network.vpc_flexion.id
  secondary_ip_range {
    range_name    = var.secondary_subnet_name
    ip_cidr_range = var.secondary_cidr
  }
}