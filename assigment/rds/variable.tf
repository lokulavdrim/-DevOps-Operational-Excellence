variable "region" {
  default = "us-east-1"
}

variable "rds_engine" {
  default = "mysql"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "your_db_password" 
}
variable "bastion_sg_id" {
  type = string
}

variable "vpc_id" {
  description = "VPC ID for the RDS cluster."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the RDS cluster."
  type        = list(string)
}

variable "db_master_password" {
  description = "Master password for the RDS cluster." 
  type        = string
  sensitive   = true
}
