
module "vpc" {
  source = "./module/vpc"
  cidr_block = "10.0.0.0/16"
  subnet_block = "10.0.1.0/24"
}

module "instance" {
  source = "./module/instance"
  subnet_instance = module.vpc.subnet_id
}
