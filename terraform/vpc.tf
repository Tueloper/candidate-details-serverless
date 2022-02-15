module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24", "10.0.104.0/24", "10.0.105.0/24"]
  public_subnets  = ["10.0.60.0/24", "10.0.61.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

output "vpc_id" {
  value = module.vpc.default_vpc_id
}

module "eip" {
  source = "./eip"
  vpc_id = module.vpc.vpc_id
}
