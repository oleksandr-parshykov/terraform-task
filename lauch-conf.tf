resource "aws_launch_configuration" "my_lc" {
  name   = "lc"
  image_id      = "${var.image_id}"
  instance_type = "${var.instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.ecr_allow.name}"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.allow_HTTP_EC2.id}"]
  enable_monitoring = true

  user_data = "${data.template_file.init.rendered}"
 
  root_block_device {
      volume_type = "${var.volume_type}"
      volume_size = "${var.volume_size}"
  }
 
  lifecycle {
    create_before_destroy = true
  }
}