module "prod" {
  source        = "github.com/kumarmulticloud/Terraform0730am/day-8-module-ex2-backup"
  aws_region    = "ap-south-1"
  ami_id        = "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  key_name      = "multicloud-keypair"
  instance_name = "module-ex2"
}