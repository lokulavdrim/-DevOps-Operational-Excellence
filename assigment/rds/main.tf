resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Security group for RDS cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  #engine_version          = "5.7.mysql_aurora.2.07.1"  
  database_name           = "mydatabase"
  master_username         = "dbmaster"
  master_password         = var.db_master_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-rds-subnet-group"
  subnet_ids = var.public_subnet_ids

  tags = {
    Name = "My RDS Subnet Group"
  }
}

