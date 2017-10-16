resource "aws_db_instance" "kptboard" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "${var.aws_db_instance_kptboard_engine_version}"
  instance_class       = "${var.aws_db_instance_kptboard_instance_class}"
  name                 = "${var.kptboard}"
  username             = "${var.aws_db_instance_kptboard_username}"
  password             = "${var.aws_db_instance_kptboard_password}"
  parameter_group_name = "default.mysql5.6"
  db_subnet_group_name = "${aws_db_subnet_group.kptboard.id}"
  skip_final_snapshot  = true
  multi_az             = false
  vpc_security_group_ids = [
    "${aws_security_group.kptboard_rds.id}"
  ]
}
