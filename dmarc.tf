resource "aws_route53_record" "dmarc" {
  zone_id = data.ns_connection.domain.outputs.zone_id
  name    = "_dmarc"
  type    = "TXT"
  ttl     = 3600
  records = ["v=DMARC1; p=none"]
}
