##General Config
variable "general_config" {
  type = map(any)
  default = {
    project = "example"
    env     = "prod"
  }
}

##Regions
variable "regions" {
  default = {
    tokyo    = "ap-northeast-1"
    virginia = "us-east-1"
  }
}

##Network
variable "vpc" {
  description = "CIDR BLOCK for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type = map(any)
  default = {
    availability_zones = {
      az-1a = {
        az = "ap-northeast-1a"
      },
      az-1c = {
        az = "ap-northeast-1c"
      }
    }
  }
}

variable "public_subnets" {
  type = map(any)
  default = {
    subnets = {
      public-1a = {
        name = "public-1a",
        cidr = "10.0.10.0/24",
        az   = "ap-northeast-1a"
      },
      public-1c = {
        name = "public-1c",
        cidr = "10.0.30.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "dmz_subnets" {
  type = map(any)
  default = {
    subnets = {
      dmz-1a = {
        name = "dmz-1a",
        cidr = "10.0.20.0/24",
        az   = "ap-northeast-1a"
      },
      dmz-1c = {
        name = "dmz-1c",
        cidr = "10.0.40.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    subnets = {
      private-1a = {
        name = "private-1a"
        cidr = "10.0.50.0/24"
        az   = "ap-northeast-1a"
      },
      private-1c = {
        name = "private-1c"
        cidr = "10.0.70.0/24"
        az   = "ap-northeast-1c"
      }
    }
  }
}

##Bastion
variable "bastion_ssh_ip" {
  description = "IP address for ssh access to bastion"
  type        = string
}

variable "instance_type_bastion" {
  description = "The type of bastion instance"
  type        = string
  default     = "t3.micro"
}

variable "volume_type_bastion" {
  description = "The type of root block device"
  type        = string
  default     = "gp2"
}

variable "volume_size_bastion" {
  description = "The size of root block device"
  default     = 100
}

variable "key_name_bastion" {
  description = "key name of the key pair"
  type        = string
}

variable "public_key_path_bastion" {
  description = "key path of the bastion's public key. Example: ~/.ssh/terraform.pub"
  type        = string
}

##Route53 Zone 
#variable "zone_name" {
#  description = "zone name of route53"
#  type        = string
#  default     = "shiratest.net"
#}

##Route53 Records
variable "sub_domain_1" {
  description = "name of sub domain"
  type        = string
  default     = "www"
}

##RDS Option Group
variable "engine_name" {
  type    = string
  default = "mysql"
}

variable "major_engine_version" {
  type    = string
  default = "8.0"
}

##RDS
variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "8.0"
}

variable "username" {
  description = "root username of db instance"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "root password of db instance"
  type        = string
  default     = "Password1!"
}

variable "instance_class" {
  description = "The class of db instance"
  type        = string
  default     = "db.t3.medium"
}

variable "storage_type" {
  description = "The storage type of db instance"
  type        = string
  default     = "gp2"
}

variable "allocated_storage" {
  description = "The allocated storage of db instance"
  default     = 20
}

variable "multi_az" {
  description = "multi az of db instance"
  type        = string
  default     = "true"
}

##ECR Image Name
variable "repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "example"
}

##Dockerimage Name
variable "image_name" {
  description = "Dockerimage name"
  type        = string
  default     = "takahiros991/apache_terraform"
}

##Dockerfile Directory
#variable "docker_dir" {
#  description = "directory where the Dockerfile is"
#  type = string
#  default     = "."
#}

##Fargate CPU
variable "fargate_cpu" {
  description = "fargate cpu"
  type        = string
  default     = "256"
}

##Fargate Memory
variable "fargate_memory" {
  description = "fargate memory"
  type        = string
  default     = "512"
}

##SSM Parameter
variable "wordpress_db_user" {
  description = "db user for wordpress"
  type        = string
}

variable "wordpress_db_password" {
  description = "db password for wordpress"
  type        = string
}

variable "wordpress_db_name" {
  description = "db name for wordpress"
  type        = string
}