output "role_demo_arn" {
  value = aws_iam_role.demo.arn
}

output "role_node_arn" {
  value = aws_iam_role.nodes.arn
}

output "policy_attachment_demo" {
  value = aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy
}

output "policy_attachment_node_readOnly" {
  value = aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly
}

output "policy_attachment_node_cni" {
  value = aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy
}

output "policy_attachment_node_nodePolicy" {
  value = aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy
}

output "policy_attachment_node_clusterPolicy" {
  value = aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy
}