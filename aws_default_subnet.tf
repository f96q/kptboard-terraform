resource "aws_default_subnet" "1a" {
  availability_zone = "${data.aws_region.current.name}a"
}

resource "aws_default_subnet" "1c" {
  availability_zone = "${data.aws_region.current.name}c"
}