##File System
resource "aws_efs_file_system" "file_system" {
  encrypted = "true"
  creation_token                  = "wordpress-efs"
  provisioned_throughput_in_mibps = "100"
  throughput_mode                 = "provisioned"

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-efs-filesystem"
  }
}

##Mount Target
resource "aws_efs_mount_target" "mount_target" {
  count = length(var.dmz_subnets.subnets)
  subnet_id = element(values(aws_subnet.dmz_subnets)[*].id, count.index % 2)
  file_system_id = aws_efs_file_system.file_system.id
  security_groups = [aws_security_group.efs.id]
}