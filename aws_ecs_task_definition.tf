data "template_file" "aws_ecs_task_definition_kptboard" {
  template = "${file("task_definitions/kptboard.json.tpl")}"

  vars {
    account_id = "${data.aws_caller_identity.current.account_id}"
    aws_region = "${data.aws_region.current.name}"
    kptboard = "${var.kptboard}"
  }
}

data "template_file" "aws_ecs_task_definition_kptboard_migration" {
  template = "${file("task_definitions/kptboard_migration.json.tpl")}"

  vars {
    account_id = "${data.aws_caller_identity.current.account_id}"
    aws_region = "${data.aws_region.current.name}"
    kptboard = "${var.kptboard}"
  }
}

resource "aws_ecs_task_definition" "kptboard" {
  family = "${var.kptboard}"
  container_definitions = "${data.template_file.aws_ecs_task_definition_kptboard.rendered}"
}

resource "aws_ecs_task_definition" "kptboard_migration" {
  family = "${var.kptboard}-migration"
  container_definitions = "${data.template_file.aws_ecs_task_definition_kptboard_migration.rendered}"
}
