resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block #"10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "hello" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_block #"10.0.1.0/24"

  tags = {
    Name = "subent"
  }
}