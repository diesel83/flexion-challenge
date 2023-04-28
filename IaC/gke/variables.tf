variable "project_id" {
  description = "project name"
  type = string
  default = "sanguine-link-385022"
}

variable "compute_region" {
    description = "set compute region"
    type = string
    default = us-central1
}

variable "compute_zone" {
    description = "set compute zone"
    type = string
    default = "us-central1-a"
}