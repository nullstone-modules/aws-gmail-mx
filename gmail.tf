locals {
  records = [
    "1 ASPMX.L.GOOGLE.COM",
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ALT3.ASPMX.L.GOOGLE.COM",
    "10 ALT4.ASPMX.L.GOOGLE.COM",
  ]
}

resource "aws_route53_record" "this" {
  name    = ""
  type    = "MX"
  zone_id = data.terraform_remote_state.domain.outputs.zone_id
  ttl     = 3600

  records = local.records
}
