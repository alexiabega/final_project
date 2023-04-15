output "vpc_id" {
  value = module.network.vpc_id
}

output "rds_endpoint" {
  value = module.database.db-instance
}

output "db-port" {
  value = module.database.db-port
}

output "db-address" {
  value = module.database.db-address
}