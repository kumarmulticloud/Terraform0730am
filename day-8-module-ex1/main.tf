module "ec2module" {
  source = "../day-8-module-1-templete"
  ami_id = "ami-0fd05997b4dff7aac"
  instancetype = "t2.micro"
  keyname = "multicloud-keypair"
  ec2name = "module-ec2"
  az = "ap-south-1a"
  bucket-name-s3 = "asdsada7582sd"
}