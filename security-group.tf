resource "aws_security_group" "allow_HTTP_LB" {
  name        = "HTTP_allow_LB"
  description = "allow_HTTP"
  #vpc_id      = "vpc-3e8af555"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.office_ip}/32"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_HTTP_EC2" {
  name        = "HTTP_allow_EC2"
  description = "allow_HTTP"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    security_groups = ["${aws_security_group.allow_HTTP_LB.id}"]
  }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}