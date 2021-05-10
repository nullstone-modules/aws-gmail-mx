resource "aws_route53_record" "spf" {
  zone_id = data.ns_connection.domain.outputs.zone_id
  name    = ""
  type    = "TXT"
  ttl     = 3600
  records = ["v=spf1 include:_spf.google.com ~all"]
}
