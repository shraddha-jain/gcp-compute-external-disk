provider "google" {
  project     = "${var.project_id}"
  region      = "${var.region}"
}

resource "google_compute_instance" "gcp_instance" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
      size = "${var.disk_size}"
      type = "${var.disk_type}"
    }
  }

  network_interface {
    network = "default"
   # subnetwork = "${var.subnetwork}"
   # subnetwork_project = "${var.subnet_project}"
    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    name = "instance-1"
    env = "dev"
    owner ="sj"
    contact = "sj@example.com"
  }
  
  metadata {
    block-project-ssh-keys = "TRUE"
  }
  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["cloud-platform"]
  }
}
