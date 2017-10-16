resource "aws_iam_policy_attachment" "kptboard_ecs" {
  name = "${var.kptboard}-ecs"
  roles = ["${aws_iam_role.kptboard_ec2.name}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_policy_attachment" "kptboard_ssm" {
  name = "${var.kptboard}-ssm"
  roles = ["${aws_iam_role.kptboard_ec2.name}"]
  policy_arn = "${aws_iam_policy.kptboard_ssm.arn}"
}

resource "aws_iam_policy_attachment" "kptboard_ecs_service" {
  name = "${var.kptboard}-ecs-service"
  roles = ["${aws_iam_role.kptboard_ecs.name}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}