resource "aws_ecs_service" "kptboard" {
  name                               = "${var.kptboard}"
  cluster                            = "${aws_ecs_cluster.kptboard.id}"
  task_definition                    = "${aws_ecs_task_definition.kptboard.arn}"
  desired_count                      = 1
  iam_role                           = "${aws_iam_role.kptboard_ecs.arn}"
  depends_on                         = ["aws_alb_listener.kptboard"]
  load_balancer {
    container_name   = "${var.kptboard}"
    container_port   = "3000"
    target_group_arn = "${aws_alb_target_group.kptboard.arn}"
  }
}
