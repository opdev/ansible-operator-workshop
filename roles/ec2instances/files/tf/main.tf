locals {
  suffix = "${replace(terraform.workspace, "_", "-")}"

  region = var.aws_region
  key_name = var.key_name
  instance_type = var.instance_type
  ami = var.ami
  instance_count = var.instance_count

  tags = {
    GithubRepo = "operator-workshop"
    GithubOrg = "opdev"
  }
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = local.key_name
  create_private_key = true
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = local.instance_count

  name = "instance-${local.suffix}-${format("%02d", count.index)}"

  ami                    = lookup(local.ami,local.region)
  instance_type          = local.instance_type
  key_name               = module.key_pair.key_pair_name

  tags = {
    Terraform   = "true"
    Environment = "prod"
    Name  = "Instance-${local.suffix}-${format("%02d", count.index)}"
  }
}
