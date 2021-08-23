variable "g-region" {
  description = "Google Region"
  type        = string
}

variable "g-zone" {
  description = "Google Zone"
  type        = string
}

variable "g-project" {
  description = "Google Project"
  type        = string
}

variable "g-machine-type" {
  description = "Google Machine Type"
  type        = string
}

variable "ssh-key" {
  description = "Your SSH Public Key"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
}

variable "AWS_ACCESS_KEY_SECRET" {
  description = "AWS Secret Key ID"
  type        = string
}

variable "DATE" {
  description = "Date of the backup to recover in format DD-MM-hhmm"
  type        = string
}