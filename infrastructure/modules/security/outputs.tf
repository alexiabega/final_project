output "role_demo_arn" {
  value = aws_iam_role.demo.arn
}

output "role_node_arn" {
  value = aws_iam_role.nodes.arn
}

output "policy_attachment_node_clusterPolicy" {
  value = aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy
}

output "DB_SECURITY_GROUP_ID" {
  value = aws_security_group.db-security-group.id
}