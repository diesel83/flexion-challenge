variable "project_id" {
  description = "project name"
  type        = string
  default     = "sanguine-link-385022"
}

variable "compute_region" {
  description = "set compute region"
  type        = string
  default     = "us-central1"
}

variable "compute_zone" {
  description = "set compute zone"
  type        = string
  default     = "us-central1-a"
}

variable "vpc_name" {
  description = "name of vpc"
  type        = string
  default     = "vpc-flexion"
}

variable "node_network" {
  description = "node network name"
  type        = string
  default     = "node-network"

}
variable "node_cidr" {
  description = "node cidr range"
  type        = string
  default     = "192.168.0.0/20"
}

variable "services_subnet_name" {
  description = "services subnet"
  type        = string
  default     = "secondary"
}

variable "services_cidr" {
  description = "services cidr block"
  type        = string
  default     = "10.0.32.0/20"
}

variable "pod_subnet_name" {
  description = "pod subnet"
  type        = string
  default     = "pod-subnet"
}

variable "pod_cidr" {
  description = "pod cidr"
  type        = string
  default     = "10.4.0.0/14"

}

variable "flexion_router_name" {
  description = "router name"
  type        = string
  default     = "flexion-router"
}

variable "flexion_nat_name" {
  description = "nat name"
  type        = string
  default     = "flexion-nat"
}

variable "app_env_label" {
  description = "label for the application environment."
  type        = string
  default     = "production"
}

variable "app_name_label" {
  description = "label for the application name"
  type        = string
  default     = "flexion-challenge"
}

variable "name_label" {
  description = "cluster label"
  type        = string
  default     = "flexion-cluster"
}

# 7.17 Ensure default Service account is not used for Project access in Kubernetes Clusters (Scored)
variable "cluster_limited_service_account" {
  description = "The limited IAM service account for Kubernetes to use rather than the GKE default."
  type        = string
  default     = "node-service-account@sanguine-link-385022.iam.gserviceaccount.com"
}

variable "cluster_master_cidr" {
  description = "CIDR for the cluster masters"
  type        = string
  default     = "172.16.0.32/28"
}

variable "cluster_type" {
  description = "Define the cluster type. Options are: production, or pre-prod."
  type        = string
  default     = "production"
}

variable "disable_horizontal_pod_autoscaling" {
  description = "toggle whether to enable the HPA"
  type        = bool
  default     = false
}

# 7.11 Ensure Network policy is enabled on Kubernetes Engine Clusters (Scored)
variable "disable_network_policy" {
  description = "toggle whether to disable the network policy"
  type        = bool
  # setting disabled to false should make it true and enable network policy
  default = false
}

variable "disable_cloudrun" {
  description = "toggle disabling cloudrun"
  type        = bool
  default     = true
}

# 7.7 Ensure 'Automatic node repair' is enabled for Kubernetes Clusters (Scored)
variable "enable_auto_repair" {
  description = "setting to enable auto repair of node pools"
  type        = bool
  default     = true
}

# 7.8 Ensure Automatic node upgrades is enabled on Kubernetes Engine Clusters nodes (Scored)
variable "enable_auto_upgrade" {
  description = "setting to enable auto upgrade of node pools"
  type        = bool
  default     = true
}

# 7.12 Ensure Kubernetes Cluster is created with Client Certificate enabled (Scored)
variable "enable_client_certificate" {
  description = "setting to enable client certificate creation"
  type        = bool
  default     = true
}

# 7.13 Ensure Kubernetes Cluster is created with Alias IP ranges enabled (Scored)
variable "enable_ip_aliasing" {
  description = "setting to enable IP Aliasing policy"
  type        = bool
  default     = true
}

# 7.11 Ensure Network policy is enabled on Kubernetes Engine Clusters (Scored)
variable "enable_network_policy" {
  description = "setting to enable network policy"
  type        = bool
  default     = false
}

# 7.15 Ensure Kubernetes Cluster is created with Private cluster enabled (Scored)
variable "enable_private_cluster_endpoint" {
  description = "setting to enable private cluster endpoint for the kube-apiserver"
  type        = bool
  default     = false
}

variable "enable_private_cluster_nodes" {
  description = "setting to enable private cluster nodes"
  type        = bool
  default     = true
}

variable "enable_remove_default_node_pool" {
  description = "setting to remove the default node pool so that the only node pools are ones explicitly created"
  type        = bool
  default     = true
}

variable "initial_default_node_pool_count" {
  description = "number of starting nodes in the default node pool to create the cluster, but then delete as soon as they stand up"
  type        = number
  default     = 1
}

variable "gke_release_channel" {
  description = "release channel for the cluster"
  type        = string
  default     = "STABLE"
}

# 7.18 Ensure Kubernetes Clusters created with limited service account Access scopes for Project access (Scored)
variable "limited_service_account_scopes" {
  description = "list of acceptable oAuth service account scopes to be in compliance with CIS 7.18."
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/devstorage.read_only"]
}

variable "maintenance_end_time" {
  description = "Time when to end a maintenance cycle."
  type        = string
  default     = "2020-11-10T06:00:00Z"
}

variable "maintenance_recurrence" {
  description = "frequency to run a maintenance cycle"
  type        = string
  default     = "FREQ=DAILY"
}

variable "maintenance_start_time" {
  description = "time when to start a maintenance cycle"
  type        = string
  default     = "2020-11-10T01:00:00Z"
}

variable "max_autoscaling_node_count" {
  description = "maximum number of nodes in the autoscaling group"
  type        = number
  default     = 2
}

variable "min_autoscaling_node_count" {
  description = "Minimium number of nodes in the autoscaling group for each Zone. There are three Zones in us-central-1 so this will create three nodes total nodes minimum, one in each Zone"
  type        = number
  default     = 1
}

variable "min_master_version" {
  description = "stable version"
  type        = string
  default     = "1.24.10-gke.2300"
}

variable "node_machine_type" {
  description = "node type"
  type        = string
  default     = "e2-standard-2"
}

variable "provisioner_label" {
  description = "provision tool"
  type        = string
  default     = "terraform"
}

variable "supported_by_label" {
  description = "support label"
  type        = string
  default     = "rene"
}

variable "authorized_master_network" {
  description = "allow home ip"
  type = object({
    network_cidr_block   = string
    network_display_name = string
  })
  default = {
    network_cidr_block   = "71.149.223.138/32"
    network_display_name = "rene-home"
  }
}