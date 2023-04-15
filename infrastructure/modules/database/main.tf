resource "aws_db_subnet_group" "db-subnet" {
  name        = "group2-db-subnet-group"
  description = "RDS subnet group"
  subnet_ids  = var.DB_SUBNETS
}

resource "aws_db_parameter_group" "db-parameters" {
  name        = "group2-db-parameters"
  family      = "postgres14"
  description = "RDS parameter group"
}

resource "aws_db_instance" "db" {
  allocated_storage       = 20
  publicly_accessible     = true
  engine                  = "postgres"
  engine_version          = "14.4"
  instance_class          = "db.t3.micro"
  identifier              = "group2-db"
  db_name                 = var.DB_NAME
  username                = var.DB_USERNAME
  password                = var.DB_PASSWORD
  db_subnet_group_name    = aws_db_subnet_group.db-subnet.name
  parameter_group_name    = aws_db_parameter_group.db-parameters.name
  multi_az                = false
  vpc_security_group_ids  = var.DB_SECURITY_GROUPS
  storage_type            = "gp2"
  backup_retention_period = 30
  availability_zone       = var.DB_AZ
  skip_final_snapshot     = true

  tags = {
    Name = "group2-db"
  }
}
