terraform {
  backend "s3" {
    acl    = "bucket-owner-full-control"
    region = "eu-west-1"
  }
}