locals {
  env = "prod"
  project_id = "atos-cloudbuild-01"
  region  = "us-central1"
}

provider "google" {
  version = "3.5.0"
  #credentials = file("/downloads/instance.json")
  project = local.project_id
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network-01"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "public-subnetwork" {
  name          = "terraform-subnetwork-01"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}
