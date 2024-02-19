terraform {
  cloud {
    organization = "acn-cloud-security"
    workspaces {
      name = "test-123"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.57.1"
    }
  }
  required_version = ">=1.3.0"
}