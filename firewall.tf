resource "google_compute_firewall" "minecraft" {
  name        = "minecraft"
  network     = "default"
  description = "Access to minecraft server port 25565"

  allow {
    protocol = "tcp"
    ports    = ["25565"]
  }
  target_tags = ["minecraft"]
}