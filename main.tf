 #$mi = "${var.aws_ami}"
#{var.foo} come from variables.tf

# Specify the provider and access details
provider "aws" {
    region = "${var.region}"
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
}


resource "aws_instance" "web" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  connection {
    # The default username for our AMI
    user = "ubuntu"
    # The path to your keyfile
    key_file = "${var.key_path}"
  }

  # subnet ID for our VPC
  subnet_id = "${var.subnet_id}"
  # the instance type we want, comes from rundeck
  instance_type = "${var.instance_type}"

  # Lookup the correct AMI based on the region
  # we specifi
  ami = "${var.aws_ami}"
  # The name of our SSH keypair you've created and downloaded
  # from the AWS console.
  #
  # https://console.aws.amazon.com/ec2/v2/home?region=us-west-2#KeyPairs:
  #
  key_name = "${var.key_name}"
}
