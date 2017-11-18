resource "aws_security_group" "kptboard_alb" {
  name = "${var.kptboard}-alb"
  vpc_id = "${aws_vpc.kptboard.id}"

  ingress = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.kptboard}-alb"
  }
}

resource "aws_security_group" "kptboard_ec2" {
  name = "${var.kptboard}-ec2"
  vpc_id = "${aws_vpc.kptboard.id}"

  ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.aws_security_group_kptboard_ecs_ssh_cidr_blocks}"
  }

  ingress = {
    from_port = 32768
    to_port   = 65535
    protocol  = "tcp"

    security_groups = [
      "${aws_security_group.kptboard_alb.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.kptboard}-ec2"
  }
}

resource "aws_security_group" "kptboard_rds" {
  name = "${var.kptboard}-rds"
  vpc_id = "${aws_vpc.kptboard.id}"

  ingress = {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"

    security_groups = [
      "${aws_security_group.kptboard_ec2.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.kptboard}-rds"
  }
}
