//Create 3 persistent ssd disks of 350G each

resource "google_compute_disk" "gluster-pd" {
  count = "${var.pd-ssd-count}"
  name  = "gluster-pd-${count.index + 1}"
  size  = "300"
  type  = "pd-standard"
  zone  = "${var.zone}"
  image = "ubuntu-1604-lts"
}
