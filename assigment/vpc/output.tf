output "public_subnet_id_output" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id_output" {
  value = aws_subnet.private_subnet.id
}
output "public_subnet_cidr" {
  value = aws_subnet.public_subnet.cidr_block
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}


output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "vpc_cidr" {
  value = aws_vpc.my_vpc.cidr_block
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}