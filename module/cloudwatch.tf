##Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "wordpress" {
  name = "/${var.general_config["project"]}/${var.general_config["env"]}/wordpress"
  retention_in_days = 30
}