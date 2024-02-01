terraform {
  backend "s3" {
    bucket = "lavdrims-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "bastion" {
  source = "./bastion"
  vpc_id = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  bastion_ami       = "ami-"
  
}

module "rds" {
  source             = "./rds"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = [module.vpc.public_subnet_id]
  db_master_password = var.db_master_password
  bastion_sg_id      = module.bastion.bastion_sg_id  
}

module "ec2_autoscaling" {
  source = "./ec2_autoscaling"
  desired_capacity = 1
  max_size = 5
  min_size = 1
  subnet_id = module.vpc.public_subnet_id
  image_id = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
}

variable "db_master_password" {
  description = "The master password for the RDS cluster."
  type = string
}
#testing branch