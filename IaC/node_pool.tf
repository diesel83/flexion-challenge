resource "google_container_node_pool" "flexion_linux_nodes" {
  autoscaling {
    min_node_count = var.min_autoscaling_node_count
    max_node_count = var.max_autoscaling_node_count
  }
  cluster = google_container_cluster.flexion-cluster.name

  initial_node_count = var.min_autoscaling_node_count

  location = var.compute_region

  management {
    auto_repair  = var.enable_auto_repair
    auto_upgrade = var.enable_auto_upgrade
  }

  name = "flexion-linux-nodes"

  node_config {

    image_type = "cos_containerd"

    labels = {
      name     = var.name_label
      app_name = var.app_name_label
      app_env  = var.app_env_label
    }
    machine_type = var.node_machine_type

    metadata = {
      # this won't change so hard-coding it here.
      disable-legacy-endpoints = "true"
    }

    # 7.17 Ensure default Service account is not used for Project access in Kubernetes Clusters (Scored)
    service_account = var.cluster_limited_service_account

    # 7.18 Ensure Kubernetes Clusters created with limited service account Access scopes for Project access (Scored)
    oauth_scopes = var.limited_service_account_scopes
  }
}