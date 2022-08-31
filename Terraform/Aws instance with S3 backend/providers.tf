terraform {
  backend "s3" {
    bucket = "di1y15bucket"
    key    = "Dauletstate"
    region = "us-east-1"
  }
}

terraform {
  required_providers {
    aws {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""  
}
