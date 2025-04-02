terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

resource "aws_instance" "splunk_server" {
  ami                  = var.ami_id
  instance_type        = "t2.medium"
  key_name             = var.key_name
  vpc_security_group_ids = [aws_security_group.splunk_sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "splunk_sg" {
  name        = "splunk-security-group"
  description = "Security group for Splunk server"

  ingress { 
    from_port = 22
    to_port = 22 
    protocol = "tcp" 
    cidr_blocks = ["0.0.0.0/0"] 
    }

    ingress { 
    from_port = 8000 
    to_port = 8000 
    protocol = "tcp" 
    cidr_blocks = ["0.0.0.0/0"] 
    }

    ingress { 
    from_port = 8089 
    to_port = 8089 
    protocol = "tcp" 
    cidr_blocks = ["0.0.0.0/0"] 
    }

   egress { 
    from_port = 0 
    to_port = 0 
    protocol = "-1" 
    cidr_blocks = ["0.0.0.0/0"] 
    }
}
