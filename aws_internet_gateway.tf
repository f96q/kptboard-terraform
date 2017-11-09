resource "aws_internet_gateway" "kptboard" {
  vpc_id = "${aws_vpc.kptboard.id}"
  tags {
    Name = "${var.kptboard}"
  }
}