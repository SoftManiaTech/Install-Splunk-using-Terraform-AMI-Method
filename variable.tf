variable "aws_secret_key" {
  type        = string
}

variable "aws_access_key" {
  type        = string
}

variable "instance_name" {
  type        = string
  description = "Name of the Splunk instance"
}

variable "region" {
  type        = string
  description = "AWS region for deployment"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
}

variable "ami_id" {
    type = string
}
