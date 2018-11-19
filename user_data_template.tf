data "template_file" "init" {
  template = "${file("user_data.sh")}"
}