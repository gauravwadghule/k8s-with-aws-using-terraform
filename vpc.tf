resource "aws_vpc" "k8_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "k8_vpc"
  }
}