provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "s3terra-kops-state"
    key    = "dev/terraform"
    region = "us-east-1"
  }
}

locals {
  azs                    = ["us-east-1a", "us-east-1b", "us-east-1c"]
  environment            = "dev"
  kops_state_bucket_name = "s3terra-kops-state"
  // Needs to be a FQDN
  kubernetes_cluster_name = "cloudsealsnr.tk"
  ingress_ips             = ["10.0.0.100/32", "10.0.0.101/32"]
  vpc_name                = "${local.environment}-vpc"

  tags = {
    environment = "${local.environment}"
    terraform   = true
  }
}

data "aws_region" "current" {}

