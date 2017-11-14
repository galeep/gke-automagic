resource "google_container_cluster" "primary" {
  name = "wordpress-cluster"
  zone = "${var.zone}"
  initial_node_count = 3

  master_auth {
    username = "${var.ma_username}"
    password = "${var.ma_password}"
  }

  network = "${google_compute_network.default.name}"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
