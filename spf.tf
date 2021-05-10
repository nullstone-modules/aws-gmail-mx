resource "aws_route53_record" "spf" {
  name    = ""
  type    = "TXT"
  zone_id = data.ns_connection.domain.outputs.zone_id
  ttl     = 3600
  records = ["v=spf1 include:_spf.google.com ~all"]
}
