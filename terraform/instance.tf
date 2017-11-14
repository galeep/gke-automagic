resource "google_compute_instance" "gluster" {
  count        = "${var.count}"
  name         = "gluster-${count.index + 1}"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  can_ip_forward = "true"

  tags = ["internal"]

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  // Mount secondary pds for gluster
  attached_disk {
    source = "${element(google_compute_disk.gluster-pd.*.name, count.index)}"
    device_name = "gluster-pd"
  }

  network_interface {
    network = "${google_compute_network.default.name}"
    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    ssh-keys = "gale:${file("${var.public_key_path}")}" 
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get install -y glusterfs-server;sudo mkdir -p /mnt/gfs && sudo mount -o discard,defaults /dev/disk/by-id/google-gluster-pd /mnt/gfs && sudo chmod a+w /mnt/gfs && echo UUID=`sudo blkid -s UUID -o value /dev/disk/by-id/google-gluster-pd` /mnt/gfs ext4 discard,defaults,[NOFAIL] 0 2 | sudo tee -a /etc/fstab"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
