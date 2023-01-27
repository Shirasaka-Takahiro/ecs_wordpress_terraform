■Set-Up
1. Create S3 for tfstate
ex)example-dev-tfstate
2. Build Dockerfile locally
3. Create publick key locally

■Resources
<br />
EC2(bastion)
<br />
ECS(fargate) x 2
<br />
ECR
<br />
ALB x 1
<br />
RDS x 1
<br />
EFS x 1
<br />
SSM Parameter Store
<br />
Cloud Watch Log Group
<br />
Route53
<br />
ACM
<br />

■Input Vabriables
<br />
bastion_ssh_ip
<br />
instance_type_bastion
<br />
key_name_bastion
<br />
public_key_path_bastion
<br />
wordpress_db_user
<br />
wordpress_db_password
<br />
wordpress_db_name
<br />

■Architecture
<br />
Go to wiki page!
<br />

■Deploy
1. Move prod directory
2. terraform init
3. terraform plan
4. terraform apply