resource "aws_route53_record" "alias_route53_record" {
  zone_id = "${var.dns_zone_id}" # Replace with your zone ID
  name    = "${var.dns_zone_name}" # Replace with your name/domain/subdomain
  type    = "A"

  alias {
    name                   = "${aws_elb.LB.dns_name}"
    zone_id                = "${aws_elb.LB.zone_id}"
    evaluate_target_health = true
  }
}