terraform {
    backend "remote" {
        organization = "davidendoro"
        workspaces {
          name = "example-workspace"
        }
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }  
}

provider "aws"{
profile = "default"
  region  = "us-east-1"
}
  

resource "aws_instance" "app_server" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name 
  }
}
