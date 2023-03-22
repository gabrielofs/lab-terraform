provider "google" {
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials)
  project     = var.project_id
}