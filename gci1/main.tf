provider "google" {
  credentials = file("/aws/gcp-creds.json")
  project = var.project
  region = var.region
  zone = var.zone
}

resource "google_compute_network" "vpc-notwork" {
  name = "cobbler-build-nets"
}