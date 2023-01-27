##Security Group for internal traffic
resource "aws_security_group" "common" {
  vpc_id = aws_vpc.vpc.id
  name = "${var.general_config["project"]}-${var.general_config["env"]}-common-sg"

  ##internal
  ingress {
    cidr_blocks = ["${var.vpc_cidr}"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-common-sg"
  }
}

##Security Group for Bastion
resource "aws_security_group" "bastion" {
  vpc_id = aws_vpc.vpc.id
  name = "${var.general_config["project"]}-${var.general_config["env"]}-bastion-sg"

  ##SSH 
  ingress {
    cidr_blocks = ["${var.bastion_ssh_ip}"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ##all_out
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-bastion-sg"
  }

}

##Security Group for alb
resource "aws_security_group" "alb" {
  vpc_id = aws_vpc.vpc.id
  name = "${var.general_config["project"]}-${var.general_config["env"]}-alb-sg"

  ##HTTP
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ##HTTPS
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  ##all_out
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-alb-sg"
  }
}

##Security Group for EFS
resource "aws_security_group" "efs" {
  vpc_id = aws_vpc.vpc.id
  name = "${var.general_config["project"]}-${var.general_config["env"]}-efs-sg"

  ##EFS
  ingress {
    security_groups = ["${aws_security_group.common.id}"]
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
  }

  ##all_out
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }

  tags = {
    name = "${var.general_config["project"]}-${var.general_config["env"]}-efs-sg"
  }
}

##Security Group form rds
resource "aws_security_group" "rds" {
  vpc_id = aws_vpc.vpc.id
  name = "${var.general_config["project"]}-${var.general_config["env"]}-rds-sg"

  ##internal
  ingress {
    cidr_blocks = ["${var.vpc_cidr}"]
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
  }

  ##all_out
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    name = "${var.general_config["project"]}-${var.general_config["env"]}-rds-sg"
  }

}