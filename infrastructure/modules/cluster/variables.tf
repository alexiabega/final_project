variable "cluster_subnets" {
  type = list(string)
}

variable "role_demo_arn" {
  type = string
}

variable "role_node_arn" {
  type = string
}

variable "policy_attachment_demo" {
  type = string
}

variable "policy_attachment_node_cni" {
  type = string
}

variable "policy_attachment_node_readOnly" {
  type = string
}


variable "policy_attachment_node_nodePolicy" {
  type = string
}


variable "policy_attachment_node_clusterPolicy" {
  type = string
}