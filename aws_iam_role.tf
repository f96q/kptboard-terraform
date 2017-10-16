resource "aws_iam_role" "kptboard_ec2" {
  name = "${var.kptboard}-ec2"
  assume_role_policy = "${file("policies/ec2_assume_role_policy.json")}"
}

resource "aws_iam_role" "kptboard_ecs" {
  name = "${var.kptboard}-ecs"
  assume_role_policy = "${file("policies/ecs_assume_role_policy.json")}"
}