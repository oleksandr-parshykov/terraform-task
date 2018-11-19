resource "aws_autoscaling_group" "my_asg" {
  name                      = "my_website"
  max_size                  = 4
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.my_lc.name}"
  vpc_zone_identifier       = ["${var.subnet_1}", "${var.subnet_2}"]
  load_balancers            = ["${aws_elb.LB.id}"]
}