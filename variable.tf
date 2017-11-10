variable "kptboard" {
  default = "kptboard"
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
