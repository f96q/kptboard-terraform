resource "aws_subnet" "kptboard_public_a" {
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = "10.0.0.0/24"
  vpc_id            = "${aws_vpc.kptboard.id}"
  tags {
    Name = "${var.kptboard}-public-a"
  }
}

resource "aws_subnet" "kptboard_public_c" {
  availability_zone = "${data.aws_region.current.name}c"
  cidr_block        = "10.0.1.0/24"
  vpc_id            = "${aws_vpc.kptboard.id}"
  tags {
    Name = "${var.kptboard}-public-c"
  }
}

resource "aws_subnet" "kptboard_private_a" {
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = "10.0.2.0/24"
  vpc_id            = "${aws_vpc.kptboard.id}"
  tags {
    Name = "${var.kptboard}-private-a"
  }
}

resource "aws_subnet" "kptboard_private_c" {
  availability_zone = "${data.aws_region.current.name}c"
  cidr_block        = "10.0.3.0/24"
  vpc_id            = "${aws_vpc.kptboard.id}"
  tags {
    Name = "${var.kptboard}-private-c"
  }
}
