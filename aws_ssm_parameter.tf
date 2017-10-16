resource "aws_ssm_parameter" "kptboard_database_url" {
  name  = "${var.kptboard}.database.url"
  type  = "SecureString"
  value = "mysql2://${var.aws_db_instance_kptboard_username}:${var.aws_db_instance_kptboard_password}@${aws_db_instance.kptboard.address}/${var.kptboard}"
}

resource "aws_ssm_parameter" "kptboard_secret_key_base" {
  name  = "${var.kptboard}.secret.key.base"
  type  = "SecureString"
  value = "${var.kptboard_secret_key_base}"
}
