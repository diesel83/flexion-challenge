terraform {
  backend "gcs" {
    bucket  = "tf-state-flexion"
    prefix  = "terraform/state"
  }
}