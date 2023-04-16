output "rds_endpoint" {
  value = module.database.db-instance
}

output "db-port" {
  value = module.database.db-port
}

output "db-address" {
  value = module.database.db-address
}

output "bucket_name" {
  value = module.storage.web-client-bucket-name
}

output "ecr_repository_name" {
  value = module.cluster.ecr_repository_name
}

output "db_username" {
  value = var.DB_USERNAME
}

output "db_password" {
  value = var.DB_PASSWORD
}

output "db_name" {
  value = var.DB_NAME
}