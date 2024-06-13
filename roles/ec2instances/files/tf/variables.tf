variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ami" {
  type        = map
  description = "AMI to use"
  default     = {
    "us-east-1" = "ami-08a0d1e16fc3f61ea"
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
