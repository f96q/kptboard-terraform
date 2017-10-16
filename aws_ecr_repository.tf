resource "aws_ecr_repository" "kptboard" {
  count = "${var.aws_ecr_repository_create == true ? 1 : 0}"
  name = "${var.kptboard}"
}
