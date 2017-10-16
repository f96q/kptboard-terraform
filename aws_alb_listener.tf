resource "aws_alb_listener" "kptboard" {
  load_balancer_arn = "${aws_alb.kptboard.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = "${aws_alb_target_group.kptboard.arn}"
    type             = "forward"
  }
}
