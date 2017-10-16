data "template_file" "aws_instance_kptboard_user_data" {
  template = "${file("user_data/kptboard.sh.tpl")}"

  vars {
    kptboard = "${var.kptboard}"
  }
}

resource "aws_instance" "kptboard" {
  ami = "${lookup(var.aws_ecs_optimized_ami_ids, data.aws_region.current.name)}"
  instance_type = "${var.aws_instance_kptboard_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.kptboard_ec2.name}"
  security_groups = ["${aws_security_group.kptboard_ecs.name}"]
  user_data       = "${data.template_file.aws_instance_kptboard_user_data.rendered}"
  key_name        = "${var.aws_instance_kptboard_key_name}"
}
