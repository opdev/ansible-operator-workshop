variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ami" {
  type        = map
  description = "AMI to use"
  default     = {
    "us-east-1" = "ami-026b57f3c383c2eec"
  }
}

variable "key_name" {
  default     = "lab-key1"
}

variable "instance_count" {
  default     = "2"
}

variable "instance_type" {
  default     = "t2.medium"
}
