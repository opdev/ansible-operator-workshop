terraform {
  backend "kubernetes" {
    secret_suffix = "ec2-state"
  }
}

provider "aws" {
  region = local.region
}

