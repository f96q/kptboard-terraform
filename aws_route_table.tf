resource "aws_route_table" "kptboard" {
  vpc_id = "${aws_vpc.kptboard.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.kptboard.id}"
  }
  tags {
    Name = "${var.kptboard}-public"
  }
}
