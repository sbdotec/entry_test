data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.5.0"

  name = "eks-kunikane-vpc"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

  enable_nat_gateway   = true
}

 module "eks" {
   source = "./modules/k8s_cluster"
 
   cluster_name = "kunikane-eks"
   k8s_version  = "1.20"
 
   subnet_ids         = concat(module.vpc.private_subnets, module.vpc.public_subnets)
   private_subnet_ids = module.vpc.private_subnets
   vpc_id             = module.vpc.vpc_id
 }