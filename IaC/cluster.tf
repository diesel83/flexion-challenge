resource "google_container_cluster" "flexion-cluster" {

  addons_config {
    cloudrun_config {
      disabled = var.disable_cloudrun
    }
    horizontal_pod_autoscaling {
      disabled = var.disable_horizontal_pod_autoscaling
    }
  }

  initial_node_count = var.initial_default_node_pool_count

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod_subnet_name
    services_secondary_range_name = var.services_subnet_name
  }

  location = var.compute_region

  maintenance_policy {
    recurring_window {
      start_time = var.maintenance_start_time
      end_time   = var.maintenance_end_time
      recurrence = var.maintenance_recurrence
    }
  }

  # 7.12 Ensure Kubernetes Cluster is created with Client Certificate enabled (Scored)
  master_auth {
    client_certificate_config {
      issue_client_certificate = var.enable_client_certificate
    }
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.authorized_master_network.network_cidr_block
      display_name = var.authorized_master_network.network_display_name
    }
  }

  min_master_version = var.min_master_version

  name = "flexion-challenge"

  network = var.vpc_name

  # hard-coding this here since this won't need to change
  networking_mode = "VPC_NATIVE"

  # 7.11 Ensure Network policy is enabled on Kubernetes Engine Clusters (Scored)
  network_policy {
    enabled  = var.enable_network_policy
    provider = "CALICO"
  }

  node_config {

    # 7.5 Ensure Kubernetes Clusters are configured with Labels (Not Scored)
    labels = {
      name        = var.name_label
      app_name    = var.app_name_label
      environment = var.app_env_label
    }

    metadata = {
      disable-legacy-endpoints = "true"
    }

    # 7.18 Ensure Kubernetes Clusters created with limited service account Access scopes for Project access (Scored)
    oauth_scopes = var.limited_service_account_scopes

    # 7.17 Ensure default Service account is not used for Project access in Kubernetes Clusters (Scored)
    service_account = var.cluster_limited_service_account

  }

  # 7.15 Ensure Kubernetes Cluster is created with Private cluster enabled (Scored)
  private_cluster_config {
    enable_private_endpoint = var.enable_private_cluster_endpoint
    enable_private_nodes    = var.enable_private_cluster_nodes
    master_ipv4_cidr_block  = var.cluster_master_cidr
    master_global_access_config {
      enabled = true
    }
  }

  remove_default_node_pool = var.enable_remove_default_node_pool

  release_channel {
    channel = var.gke_release_channel
  }

  # 7.5 Ensure Kubernetes Clusters are configured with Labels (Not Scored)
  resource_labels = {
    name_label         = var.name_label
    app_name_label     = var.app_name_label
    app_env_label      = var.app_env_label
    provisioner_label  = var.provisioner_label
    supported_by_label = var.supported_by_label
  }
  subnetwork = var.node_network

}