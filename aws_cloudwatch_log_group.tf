resource "aws_cloudwatch_log_group" "kptboard" {
  name = "${var.kptboard}"
}
