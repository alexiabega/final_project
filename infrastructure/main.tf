module "network" {
  source = "./modules/network"
}

module "cluster" {
  source = "./modules/cluster"
  cluster_subnets = module.network.subnets_aws
  role_demo_arn = module.security.role_demo_arn
  role_node_arn = module.security.role_node_arn
  policy_attachment_node_clusterPolicy = module.security.policy_attachment_node_clusterPolicy
}

module "security" {
  source = "./modules/security"
  cluster_subnets = module.network.subnets_aws
}
