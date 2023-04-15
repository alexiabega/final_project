output "subnets_aws" {
  value = [
    for subnet in aws_subnet.main-public-subnets : subnet.id
  ]
}

output "vpc_id" {
  value = aws_vpc.main-vpc.id
}