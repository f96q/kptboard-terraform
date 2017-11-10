data "template_file" "aws_instance_kptboard_user_data" {
  template = "${file("user_data/kptboard.sh.tpl")}"

  vars {
    kptboard = "${var.kptboard}"
  }
}

data "aws_ami" "ecs_optimized" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }
}

resource "aws_instance" "kptboard" {
  ami = "${data.aws_ami.ecs_optimized.id}"
  instance_type = "${var.aws_instance_kptboard_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.kptboard_ec2.name}"
  security_groups = ["${aws_security_group.kptboard_ecs.name}"]
  user_data       = "${data.template_file.aws_instance_kptboard_user_data.rendered}"
  key_name        = "${var.aws_instance_kptboard_key_name}"
}
