##ECR Repository
resource "aws_ecr_repository" "wordpress" {
  name = var.repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

##AWS Account ID
data "aws_caller_identity" "current" {}

##Build up Dockerfile  
resource "null_resource" "wordpress" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.regions["tokyo"]} | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.regions["tokyo"]}.amazonaws.com"
  }

  #provisioner "local-exec" {
  #  command = "docker build -t ${var.image_name} ${var.docker_dir}"
  #}

  provisioner "local-exec" {
    command = "docker tag ${var.image_name}:v1 ${aws_ecr_repository.wordpress.repository_url}:latest"
  }

  provisioner "local-exec" {
    command = "docker push ${aws_ecr_repository.wordpress.repository_url}:latest"
  }
}