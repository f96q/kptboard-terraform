data "template_file" "kptboard_ssm_policy" {
  template = "${file("policies/kptboard_ssm_policy.json.tpl")}"

  vars {
    account_id = "${data.aws_caller_identity.current.account_id}"
    region = "${data.aws_region.current.name}"
    kptboard = "${var.kptboard}"
  }
}

resource "aws_iam_policy" "kptboard_ssm" {
  name = "${var.kptboard}-ssm"
  policy = "${data.template_file.kptboard_ssm_policy.rendered}"
}
