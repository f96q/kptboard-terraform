resource "aws_db_subnet_group" "kptboard" {
  name = "${var.kptboard}"
  subnet_ids = [
    "${aws_subnet.kptboard_private_a.id}",
    "${aws_subnet.kptboard_private_c.id}",
  ]
}
