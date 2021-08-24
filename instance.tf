resource "google_compute_instance" "minecraft" {
  name = "cuarentenacraft"
  machine_type = var.g-machine-type
  allow_stopping_for_update = true
  tags = ["http-server", "https-server", "minecraft"]
  boot_disk {
    initialize_params {
      size  = 30
      type  = "pd-ssd"
      image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210820"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  metadata = {
    ssh-keys = var.ssh-key
  }

  # metadata_startup_script = data.template_file.minecraft.rendered
}

data "template_file" "minecraft" {
  template = file("startup.tpl")
  vars = {
    AWS_ACCESS_KEY_ID     = var.AWS_ACCESS_KEY_ID
    AWS_ACCESS_KEY_SECRET = var.AWS_ACCESS_KEY_SECRET
    DATE                  = var.DATE
  }
}