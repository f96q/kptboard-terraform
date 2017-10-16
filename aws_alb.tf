resource "aws_alb" "kptboard" {
  name = "${var.kptboard}"

  subnets = [
    "${aws_default_subnet.1a.id}",
    "${aws_default_subnet.1c.id}",
  ]

  security_groups = ["${aws_security_group.kptboard_alb.id}"]
}
