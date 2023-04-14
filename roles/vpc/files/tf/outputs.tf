output "sno-lab-vpc-subnet-private" {
  value = module.vpc.private_subnets
}
output "sno-lab-vpc-subnet-public" {
  value = module.vpc.public_subnets
}
