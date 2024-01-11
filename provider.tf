provider "aws" {
  region = local.region
}

terraform {
  backend "s3" {
    bucket = "cicd-dareyy"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}