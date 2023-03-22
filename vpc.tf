resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = var.vpc_subnet_name
  ip_cidr_range = var.ip_subnet_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
}