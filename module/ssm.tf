##SSM Parameter
resource "aws_ssm_parameter" "wordpress_db_host" {
  name        = "WORDPRESS_DB_HOST"
  type        = "String"
  value       = aws_db_instance.rds.address
}
 
resource "aws_ssm_parameter" "wordpress_db_user" {
  name        = "WORDPRESS_DB_USER"
  type        = "String"
  value       = var.wordpress_db_user
}
 
resource "aws_ssm_parameter" "wordpress_db_password" {
  name        = "WORDPRESS_DB_PASSWORD"
  type        = "String"
  value       = var.wordpress_db_password
}
 
resource "aws_ssm_parameter" "wordpress_db_name" {
  name        = "WORDPRESS_DB_NAME"
  type        = "String"
  value       = var.wordpress_db_name
}