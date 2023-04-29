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
  default     = "10.2.0.0/16"
}

variable "secondary_subnet_name" {
  description = "name of subnet"
  type        = string
  default     = "secondary"
}

variable "secondary_cidr" {
  description = "secondary cidr block"
  type        = string
  default     = "192.168.10.0/24"
}

variable "pod_subnet_name" {
  description = "pod subnet"
  type        = string
  default     = "pod-subnet"
}

variable "pod_cidr" {
  description = "pod cidr"
  type        = string
  default     = "192.168.64.0/22"

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