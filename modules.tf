module "aws_az" {
  source = "github.com/terraform-community-modules/tf_aws_availability_zones"
  region = "${var.aws_region}"
  account = "default"
}

module "ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
  region = "${var.aws_region}"
  distribution = "trusty"
  architecture = "amd64"
  virttype = "hvm"
  storagetype = "ebs-ssd"
}
