terraform {
    required_version = ">= 0.12"
    backend "s3" {
      bucket = "terraform-state-matthausen"
      key = "terraform.tfstate"
      region = "eu-west-2"
    }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

module "elastic-container-registry" {
  source = "./ecr"
}

# module "mysql_db" {
#   source = "./db/mysql"
# }

module "elastic-container-service" {
  source = "./ecs"
}

