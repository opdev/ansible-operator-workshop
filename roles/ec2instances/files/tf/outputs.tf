output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable."
  value       = module.ec2_instance.*.public_ip
}

output "private_key_pem" {
  description = "The private key used to access the ec2 instance"
  value       = module.key_pair.private_key_pem
  sensitive   = true
}

output "public_key" {
  description = "The public key which will be used to create the SNO clusters"
  value       = module.key_pair.public_key_openssh
  sensitive   = true
}

output "all" {
  description = "Full output of the module"
  value       = module.ec2_instance
}