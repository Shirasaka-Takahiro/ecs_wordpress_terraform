##Cluster
resource "aws_ecs_cluster" "cluster" {
  name = "${var.general_config["project"]}-${var.general_config["env"]}-cluster-fargate-wordpress"
 
  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
 
##Task Definition
resource "aws_ecs_task_definition" "task" {
  family                = "${var.general_config["project"]}-${var.general_config["env"]}-task-fargate-wordpress"
  container_definitions = templatefile("${path.module}/ecs_json/container_definitions.json", 
  { ecr_repository_url = aws_ecr_repository.wordpress.repository_url, cw_log_group = aws_cloudwatch_log_group.wordpress.name }
  )
  cpu                   = var.fargate_cpu
  memory                = var.fargate_memory
  network_mode          = "awsvpc"
  execution_role_arn    = aws_iam_role.fargate_task_execution.arn
 
  volume {
    name = "fargate-wordpress-efs"

    efs_volume_configuration {
      file_system_id = aws_efs_file_system.file_system.id
      root_directory = "/"
    }
  }

  requires_compatibilities = [
    "FARGATE"
  ]
}
 
##Service
resource "aws_ecs_service" "service" {
  name             = "service-fargate-wordpress"
  cluster          = aws_ecs_cluster.cluster.arn
  task_definition  = aws_ecs_task_definition.task.arn
  desired_count    = 2
  launch_type      = "FARGATE"
  platform_version = "1.4.0"
 
  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "${var.general_config["project"]}-${var.general_config["env"]}-wordpress"
    container_port   = "80"
  }
 
  network_configuration {
    subnets = var.dmz_subnet_ids
    security_groups = [
      aws_security_group.common.id
    ]
    assign_public_ip = false
  }
}