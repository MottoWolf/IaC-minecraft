resource "google_compute_instance" "minecraft" {
  name = "cuarentenacraft"
  #machine_type = var.g-machine-type
  machine_type = "e2-custom-4-18432"
  zone         = var.g-zone

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
    ssh-keys = "j.motto.sanchez:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCp4/WFUrNTPkF0fe+aNMfkFIVsSlsik4UEJmaSIHGaT59guFYvAEgL2eKquESgFyrPu+Zzw+XZsf3EuWl8qgcACHhsV2XIUbXe+rutLSuFFIcB6iiCOcjHff+w9WSBlVXH6Sdj8PZDylBofVl097pi9ibJc+8qjCAx6hWfv3jgGT8XNrpR/BiTZJzYJD2WW31QJWUkmLdv+mbZNtGsePzSMdjy0SSGz4JZVUi2qkCoYoa3gvJInF4LAz3iL1oHJYiMJ969lQA/f+YWM9TR9lhoAwXReHkZBYrv3YT16y9tMchSRxpOTzEvKeMVyZEKQaEKiHfC18LCVpQnAZveO6Z5+pnMmAw8ooxKumRCPMYUnn2EG/bWHKqOrYFDaQiU7zDlATvFZmcOSRwVIMtB6C9nEeA8t9GwMlyJ7wIt+YZ7xkBwtYjcx29yBT6CkPrXOheB8L9+MIU7FWb1auZgktGFWOJM77mWHnBok1NyOtQ9L6UB0tXX6QsCnjfQKiMk75GmGw+Z2xxyjCSDWxPUwmlqvSGYvXLQJHVMvFNm86+CyyqcPQqLChBe+7myxivfEOnu3uqWhyhIT8QiL7jugDRfxB9re5Btc1DeJA3RHBMBGbHQtglAUU1AX1scuWuvD8xM2A5SnDhMTv+HI1PxXT9VasMLsgVpop4cWNmjgK8bw== j.motto.sanchez@gmail.com"
  }

  metadata_startup_script = file("startup.sh")
}