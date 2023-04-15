output "db-address" {
  value = aws_db_instance.db.address
}

output "db-port" {
  value = aws_db_instance.db.port
}

output "db-instance" {
  value = aws_db_instance.db.endpoint
}