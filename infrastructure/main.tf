module "network" {
  source = "./modules/network"
}

module "cluster" {
  source = "./modules/cluster"
  cluster_subnets = module.network.subnets_aws
  role_demo_arn = module.security.role_demo_arn
  role_node_arn = module.security.role_node_arn
  policy_attachment_demo = module.security.policy_attachment_demo
  policy_attachment_node_cni = module.security.policy_attachment_node_cni
  policy_attachment_node_nodePolicy = module.security.policy_attachment_node_nodePolicy
  policy_attachment_node_readOnly = module.security.policy_attachment_node_readOnly
  policy_attachment_node_clusterPolicy = module.security.policy_attachment_node_clusterPolicy
}

module "security" {
  source = "./modules/security"
  cluster_subnets = module.network.subnets_aws
}
