module "ec2" {
  source         = "./modules/ec2"
  key_pair_name  = var.key_pair_name
}

module "budgets" {
  source = "./modules/budgets"
  email  = var.email
}

module "lambda_app" {
  source = "./modules/lambda"
}

module "rds" {
  source   = "./modules/rds"
  password = var.db_password
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "api_url" {
  value = module.lambda_app.api_url
}

output "rds_endpoint" {
  value = module.rds.endpoint
}
