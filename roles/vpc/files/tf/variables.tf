variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}
variable "workshop_name" {
  type        = string
  description = "Name for workshop. Must be valid K8S namespace."
}
