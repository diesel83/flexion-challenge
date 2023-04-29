# create vpc network
# best pracitice is to delete default network 
resource "google_compute_network" "vpc_flexion" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.node_network
  ip_cidr_range = var.node_cidr
  region        = var.compute_region
  network       = google_compute_network.vpc_flexion.id
  secondary_ip_range {
    range_name    = var.services_subnet_name
    ip_cidr_range = var.services_cidr
  }
  secondary_ip_range {
    range_name    = var.pod_subnet_name
    ip_cidr_range = var.pod_cidr
  }
}

resource "google_compute_router" "flexion-router" {
  name    = var.flexion_router_name
  region  = google_compute_subnetwork.network-with-private-secondary-ip-ranges.region
  network = google_compute_network.vpc_flexion.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "flexion-nat" {
  name                               = var.flexion_nat_name
  router                             = google_compute_router.flexion-router.name
  region                             = google_compute_router.flexion-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource "google_compute_firewall" "allow-internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc_flexion.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = ["192.168.0.0/20"]

}
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_flexion.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
}



