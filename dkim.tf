resource "aws_route53_record" "dkim" {
  name    = var.dkim.name
  type    = "TXT"
  zone_id = data.ns_connection.domain.outputs.zone_id
  ttl     = 3600
  records = [var.dkim.value]

  count = var.dkim != null && length(var.dkim.value) > 0 ? 1 : 0
}
