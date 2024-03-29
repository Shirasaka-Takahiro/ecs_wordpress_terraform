##Bastion Instance
resource "aws_instance" "bastion" {
  ami = var.ami_bastion
  subnet_id = var.public_subnet_ids[0]
  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]
  key_name = aws_key_pair.key_bastion.id
  instance_type = var.instance_type_bastion
  root_block_device {
    volume_type = var.volume_type_bastion
    volume_size = var.volume_size_bastion
  }

  ##Install MySQL client
  user_data = <<EOF
  #!/bin/bash
  yum update -y

  ### mysql
  wget https://dev.mysql.com/get/mysql80-community-release-el7-7.noarch.rpm
  yum localinstall -y mysql80-community-release-el7-7.noarch.rpm
  yum install -y mysql-community-client
  EOF

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-bastion01"
  }
}

##Elastic IP for Bastion instance
resource "aws_eip" "eip_bastion" {
  vpc = true
  instance = aws_instance.bastion.id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-eip-bastion"
  }
}

##Key Pair
resource "aws_key_pair" "key_bastion" {
  key_name   = var.key_name_bastion
  public_key = "${file(var.public_key_path_bastion)}"
}