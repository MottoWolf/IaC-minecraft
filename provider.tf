provider "google" {
  region  = var.g-region
  zone    = var.g-zone
  project = var.g-project
}

provider "aws" {
  region = var.region
}