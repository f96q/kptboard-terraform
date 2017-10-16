variable "kptboard" {
  default = "kptboard"
}

# http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
variable "aws_ecs_optimized_ami_ids" {
  default = {
    "us-east-2"      = "ami-34032e51"
    "us-east-1"      = "ami-ec33cc96"
    "us-west-2"      = "ami-29f80351"
    "us-west-1"      = "ami-d5d0e0b5"
    "eu-west-2"      = "ami-eb62708f"
    "eu-west-1"      = "ami-13f7226a"
    "eu-central-1"   = "ami-40d5672f"
    "ap-northeast-1" = "ami-21815747"
    "ap-southeast-2" = "ami-4f08e82d"
    "ap-southeast-1" = "ami-99f588fa"
    "ca-central-1"   = "ami-9b54edff"
  }
}

variable "aws_instance_kptboard_instance_type" {
  default = "t2.micro"
}

variable "aws_db_instance_kptboard_engine_version" {
  default = "5.6.35"
}

variable "aws_db_instance_kptboard_instance_class" {
  default = "db.t2.micro"
}

variable "aws_db_instance_kptboard_username" {
  default = "root"
}

variable "aws_security_group_kptboard_ecs_ssh_cidr_blocks" {
  type = "list"
}

variable "aws_instance_kptboard_key_name" {}

variable "aws_db_instance_kptboard_password" {}

variable "aws_ecr_repository_create" {
  default = true
}

variable "kptboard_secret_key_base" {}
