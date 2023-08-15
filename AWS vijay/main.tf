/*
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "webbb" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
 # key_name = "vijay"
  user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo apt update -y
sudo apt install wget -y
sudo apt install openjdk-11-jdk -y
sudo apt install openjdk-11-jre-headless -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
sudo apt update -y
apt list --upgradable
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins

EOF 

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_s3_bucket" "bsj" {
  count = 5 
  bucket = "${count.index}my-tf-test-${count.index}bucket-viajakay${count.index}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
*/


module "vpc" {
  source = "./module/vpc"
  cidr_block = "10.0.0.0/16"
  subnet_block = "10.0.1.0/24"
}

module "instance" {
  source = "./module/instance"
  subnet_instance = module.vpc.subnet_id
}