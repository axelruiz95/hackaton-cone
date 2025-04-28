module "s3" {
  source      = "./modules/s3"
  name        = var.name
  environment = var.environment
  project     = var.project
  tags        = var.tags
  owner       = var.owner
}

module "dynamodb" {
  source      = "./modules/dynamodb"
  name        = var.name
  environment = var.environment
  project     = var.project
  tags        = var.tags
  owner       = var.owner
}

module "rds" {
  source      = "./modules/rds"
  name        = var.name
  environment = var.environment
  project     = var.project
  tags        = var.tags
  owner       = var.owner
  db_username = var.db_username
  db_password = var.db_password
}

module "eks" {
  source      = "./modules/eks"
  name        = var.name
  environment = var.environment
  project     = var.project
  tags        = var.tags
  subnet_ids  = module.vpc.public_subnet_ids
  owner       = var.owner
}

module "vpc" {
  source               = "./modules/vpc"
  name                 = var.name
  environment          = var.environment
  project              = var.project
  tags                 = var.tags
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "jenkins_ec2" {
  source             = "./modules/ec2"
  name               = var.name
  environment        = var.environment
  project            = var.project
  tags               = var.tags
  owner              = var.owner
  ami_id             = "ami-0e54f1b41c24e4f5e"
  instance_type      = "t4g.medium"
  subnet_id          = module.vpc.public_subnet_ids[0]
  key_name           = "ngo-keypair"
  vpc_id             = module.vpc.vpc_id
  security_group_id  = module.security.jenkins_sg_id
}

module "eventbridge" {
  source      = "./modules/eventbridge"
  name        = var.name
  environment = var.environment
  project     = var.project
  tags        = var.tags
  owner       = var.owner
}

module "security" {
  source        = "./modules/security"
  name          = var.name
  environment   = var.environment
  project       = var.project
  tags          = var.tags
  owner         = var.owner
  vpc_id        = module.vpc.vpc_id
  resource_arn  = module.networking.cloudfront_distribution_arn
}

module "networking" {
  source                       = "./modules/networking"
  name                         = var.name
  environment                  = var.environment
  project                      = var.project
  tags                         = var.tags
  owner                        = var.owner
  s3_bucket_regional_domain_name = module.s3.bucket_regional_domain_name
}

module "monitoring" {
  source          = "./modules/monitoring"
  name            = var.name
  environment     = var.environment
  project         = var.project
  tags            = var.tags
  owner           = var.owner
  ec2_instance_id = module.jenkins_ec2.instance_id
}
