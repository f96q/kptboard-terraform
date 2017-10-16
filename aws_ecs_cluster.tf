resource "aws_ecs_cluster" "kptboard" {
  name = "${var.kptboard}"
}