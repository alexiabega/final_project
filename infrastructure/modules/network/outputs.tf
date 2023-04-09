output "subnets_aws" {
  value = [
    for subnet in aws_subnet.main-public-subnets : subnet.id
  ]
}