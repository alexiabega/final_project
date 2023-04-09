module "network" {
  source = "./modules/network"
}

module "cluster" {
  source = "./modules/cluster"
  cluster_subnets = module.network.subnets_aws
}
