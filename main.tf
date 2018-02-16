provider "google" {
  project     = "${var.project_id}"
  region      = "${var.region}"
}

resource "google_compute_instance" "gcp_instance" {
  name         = "${var.prefix}-inst"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
      size = "${var.disk_size}"
      type = "${var.disk_type}"
    }
  }
  
  attached_disk {
    source = "${google_compute_disk.gcp_compute_disk.self_link}"
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

resource "google_compute_disk" "gcp_compute_disk" {
  name  = "${var.prefix}-disk"
  type  = "${var.disk_type}"
  zone  = "${var.zone}"
  image = "${var.disk_image}"
  labels {
    environment = "dev"
  }
}
