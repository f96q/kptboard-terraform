resource "aws_iam_instance_profile" "kptboard_ec2" {
  name = "${var.kptboard}-ec2"
  role = "${aws_iam_role.kptboard_ec2.name}"
}
