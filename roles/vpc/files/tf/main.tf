locals {
  suffix = "${replace(terraform.workspace, "_", "-")}"
  name = "sno-lab-vpc-${local.suffix}"

  region = var.aws_region

  azs = formatlist("${data.aws_region.current.name}%s", ["a", "b"])

  tags = {
    GithubRepo = "ansible-operator-workshop"
    GithubOrg = "opdev"
  }
}

data "aws_region" "current" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name
  cidr = "10.0.0.0/16"

  azs             = local.azs

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_support = true
  enable_dns_hostnames = true
  
  instance_tenancy = "default"

  public_subnets  = ["10.0.128.0/20"]
  private_subnets = ["10.0.0.0/20"]

  tags = {
    Terraform = "true"
    Environment = "prod"
  }
}

module "vpc_endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"

  vpc_id             = module.vpc.vpc_id

  endpoints = {
    s3 = {
      service = "s3"
      tags    = { Name = "s3-vpc-endpoint" }
    },
  }

  tags = merge(local.tags, {
    Project  = "Secret"
    Endpoint = "true"
  })
}

