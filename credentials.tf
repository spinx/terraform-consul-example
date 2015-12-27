# AWS credentials
variable "aws_region" {
  description = "AWS region to launch servers in."
  default = "eu-west-1"
}

variable "key_name" {
    description = "SSH key name in your AWS account for AWS instances."
    default = "default"
}

variable "key_path" {
    description = "Path to the private key specified by key_name."
    default = "~/.ssh/id_rsa"
}

provider "aws" {
    access_key = "___YOUR_ACCESS_KEY___"
    secret_key = "___YOUR_SECRET_KEY___"

    region = "${var.aws_region}"
}

# Atlas credentials
variable "atlas_token" {
    default = "___YOUR_TOKEN___"
}

variable "atlas_name" {
    default = "___YOUR_ATLAS_USER___/terraform-consul-example"
}

provider "atlas" {
    token = "${var.atlas_token}"
    name = "${var.atlas_name}"
}