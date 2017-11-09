resource "aws_alb" "kptboard" {
  name = "${var.kptboard}"

  subnets = [
    "${aws_subnet.kptboard_public_a.id}",
    "${aws_subnet.kptboard_public_c.id}",
  ]

  security_groups = ["${aws_security_group.kptboard_alb.id}"]
}
