terraform {
  backend "kubernetes" {
    secret_suffix = "vpc-state"
  }
}

provider "aws" {
  region = local.region
}
