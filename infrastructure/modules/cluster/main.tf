resource "aws_eks_cluster" "group2EKS" {
  name     = "group2EKS"
  role_arn = var.role_demo_arn

  vpc_config {
    subnet_ids = var.cluster_subnets
  }

  depends_on = [var.policy_attachment_node_clusterPolicy]
}

resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = aws_eks_cluster.group2EKS.name
  node_group_name = "private-nodes"
  node_role_arn   = var.role_node_arn

  subnet_ids = var.cluster_subnets

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 1
    max_size     = 5
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }
}

resource "aws_ecr_repository" "ecr-repository" {
  name = "group2-ecr"
}

