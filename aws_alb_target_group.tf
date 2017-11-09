resource "aws_alb_target_group" "kptboard" {
  name = "${var.kptboard}"
  port = 80
  protocol = "HTTP"
  vpc_id = "${aws_vpc.kptboard.id}"

  health_check {
    path = "/health_check"
  }
}
