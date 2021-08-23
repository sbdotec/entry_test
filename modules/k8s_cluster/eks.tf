module "main" {
  source  = "terraform-aws-modules/eks/aws"
  version = "14.0.0"

  cluster_name    = var.cluster_name
  cluster_version = var.k8s_version
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  node_groups = {
    eks_node_groups = {
      target_group_arns = [aws_alb_target_group.tg.arn]
      subnets = var.private_subnet_ids
    }
  }
}
