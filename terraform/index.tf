provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
  vpc_name = "Serverless and Terraform"
}

module "dbserver" {
  source = "./db"
  dbName = "DB Server Module"
}

output "public_ip" {
  value = module.webserver.webServerFixedIp
}

output "private_ip" {
  value = module.dbserver.private_ip
}
