terraform {
  backend "s3" {
    bucket = "daulet-s3-bucket-test"
    key    = "Daulet_state"
    region = "us-east-1"
  }
}
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
  region  = "us-east-1"
}