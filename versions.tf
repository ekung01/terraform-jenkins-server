terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  backend "s3" {
    bucket         = "jenkins-statefiles-2024"
    key            = "jenkins/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "jenkins-terraform-state-lock"
  }
}


