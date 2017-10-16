resource "aws_db_subnet_group" "kptboard" {
  name = "${var.kptboard}"
  subnet_ids = [
    "${aws_default_subnet.1a.id}",
    "${aws_default_subnet.1c.id}",
  ]
}
