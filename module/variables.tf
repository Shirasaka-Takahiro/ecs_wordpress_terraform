variable "general_config" {
  type = map(any)
}
variable "regions" {
  type = map(any)
}
variable "vpc_cidr" {}
variable "availability_zones" {}
variable "public_subnets" {}
variable "dmz_subnets" {}
variable "private_subnets" {}
variable "public_subnet_ids" {}
variable "dmz_subnet_ids" {}
variable "private_subnet_ids" {}
#variable "zone_name" {}
variable "sub_domain_1" {}
variable "engine_name" {}
variable "major_engine_version" {}
variable "engine" {}
variable "engine_version" {}
variable "username" {}
variable "password" {}
variable "instance_class" {}
variable "storage_type" {}
variable "allocated_storage" {}
variable "multi_az" {}
variable "repository_name" {}
variable "image_name" {}
#variable "docker_dir" {}
variable "fargate_cpu" {}
variable "fargate_memory" {}
variable "wordpress_db_user" {}
variable "wordpress_db_password" {}
variable "wordpress_db_name" {}
provider "aws" {
  alias  = "us-east-1"
  region = var.regions["virginia"]
}