resource "aws_route_table_association" "kptboard_a" {
  route_table_id = "${aws_route_table.kptboard.id}"
  subnet_id      = "${aws_subnet.kptboard_public_a.id}"
}

resource "aws_route_table_association" "kptboard_c" {
  route_table_id = "${aws_route_table.kptboard.id}"
  subnet_id      = "${aws_subnet.kptboard_public_c.id}"
}
