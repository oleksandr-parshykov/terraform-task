resource "aws_elb" "LB" {
  name = "Website"
  internal = false
  security_groups = ["${aws_security_group.allow_HTTP_LB.id}"]
  #availability_zones = ["eu-central-1a", "eu-central-1b"]
  subnets = ["${var.subnet_1}", "${var.subnet_2}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 10
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 5 #300
  connection_draining         = true
  connection_draining_timeout = 5 #300

  tags {
    Name = "My_Website_LB"
  }
}