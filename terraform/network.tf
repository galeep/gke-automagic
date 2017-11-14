resource "google_compute_network" "default" {
  name                    = "wp-k8"
  auto_create_subnetworks = "true"
}
