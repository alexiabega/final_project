module "network" {
  source = "./modules/network"
}

module "cluster" {
  source                               = "./modules/cluster"
  cluster_subnets                      = module.network.subnets_aws
  role_demo_arn                        = module.security.role_demo_arn
  role_node_arn                        = module.security.role_node_arn
  policy_attachment_node_clusterPolicy = module.security.policy_attachment_node_clusterPolicy
}

module "security" {
  source          = "./modules/security"
  cluster_subnets = module.network.subnets_aws
  vpc_id = module.network.vpc_id
}

module "database" {
  source             = "./modules/database"
  DB_SUBNETS         = module.network.subnets_aws
  DB_SECURITY_GROUPS = [module.security.DB_SECURITY_GROUP_ID]
  DB_USERNAME        = var.DB_USERNAME
  DB_PASSWORD        = var.DB_PASSWORD
  DB_NAME            = var.DB_NAME
  DB_AZ              = "eu-north-1a"
}

module "storage" {
  source = "./modules/storage"
}