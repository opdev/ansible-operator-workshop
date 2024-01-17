locals {
  suffix    = replace(terraform.workspace, "_", "-")
  workspace = terraform.workspace

  region         = var.aws_region
  key_name       = var.key_name
  instance_type  = var.instance_type
  ami            = var.ami
  instance_count = var.instance_count

  tags = {
    GithubRepo  = "operator-workshop"
    GithubOrg   = "opdev"
    Terraform   = "true"
    Environment = "prod"
    Workshop    = terraform.workspace
  }
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = local.key_name
  create_private_key = true
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  count = local.instance_count

  name = "instance-${local.suffix}-${format("%02d", count.index)}"

  ami           = lookup(local.ami, local.region)
  instance_type = local.instance_type
  key_name      = module.key_pair.key_pair_name

  tags = merge(local.tags, {
    Name = "Instance-${local.suffix}-${format("%02d", count.index)}"
    Sno  = "sno-lab-${local.workspace}-${format("%02x", count.index)}"
  })
}
