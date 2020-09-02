resource "aws_route53_record" "this" {
  name    = ""
  type    = "MX"
  zone_id = data.terraform_remote_state.domain.outputs.zone_id
  ttl     = 3600

  records = [
    "ASPMX.L.GOOGLE.COM",
    "ALT1.ASPMX.L.GOOGLE.COM",
    "ALT2.ASPMX.L.GOOGLE.COM",
    "ALT3.ASPMX.L.GOOGLE.COM",
    "ALT4.ASPMX.L.GOOGLE.COM",
  ]
}
