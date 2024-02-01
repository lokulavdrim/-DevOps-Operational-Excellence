variable "bastion_ami" {
  default = "ami-"
}
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "vpc_id" {
  description = "The ID of the VPC where resources will be created."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where the bastion host will be launched."
  type        = string
}
