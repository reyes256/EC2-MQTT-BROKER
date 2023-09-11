module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Broker-VPC"
  cidr = "10.10.0.0/16"

  azs             = ["us-east-2a"]
  public_subnets  = ["10.10.101.0/24"]
}