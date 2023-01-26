provider "aws" {
  profile = "terraform-user"
  region  = var.regions["tokyo"]
}

provider "aws" {
  profile = "terraform-user"
  alias   = "us-east-1"
  region  = var.regions["virginia"]
}

module "prod" {
  source = "../../module"

  general_config     = var.general_config
  regions            = var.regions
  availability_zones = var.availability_zones
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  dmz_subnets        = var.dmz_subnets
  private_subnets    = var.private_subnets
  public_subnet_ids  = module.prod.public_subnet_ids
  dmz_subnet_ids     = module.prod.dmz_subnet_ids
  private_subnet_ids = module.prod.private_subnet_ids
  #zone_name          = var.zone_name
  sub_domain_1          = var.sub_domain_1
  engine_name           = var.engine_name
  major_engine_version  = var.major_engine_version
  engine                = var.engine
  engine_version        = var.engine_version
  username              = var.username
  password              = var.password
  instance_class        = var.instance_class
  storage_type          = var.storage_type
  allocated_storage     = var.allocated_storage
  multi_az              = var.multi_az
  repository_name       = var.repository_name
  image_name            = var.image_name
  fargate_cpu           = var.fargate_cpu
  fargate_memory        = var.fargate_memory
  wordpress_db_user     = var.wordpress_db_user
  wordpress_db_password = var.wordpress_db_password
  wordpress_db_name     = var.wordpress_db_name
}