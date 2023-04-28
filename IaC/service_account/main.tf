# create service account
resource "google_service_account" "terraform_user" {
  account_id   = "terraform-user"
  display_name = "terraform provisioner"
}

# service account IAM
resource "google_project_iam_member" "terraform_user" {
  project = var.project_id
  role    = "roles/datastore.owner"
  member  = "serviceAccount:${google_service_account.terraform_user.email}"
}

# computer network user, k8s engine admin,k8s engine host service (maybe), service account user