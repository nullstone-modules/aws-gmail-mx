locals {
  mx = {
    "ASPMX.L.GOOGLE.COM" : 1,
    "ALT1.ASPMX.L.GOOGLE.COM" : 5,
    "ALT2.ASPMX.L.GOOGLE.COM" : 5,
    "ALT3.ASPMX.L.GOOGLE.COM" : 10,
    "ALT4.ASPMX.L.GOOGLE.COM" : 10,
  }
}

resource "aws_route53_record" "main" {
  name    = ""
  type    = "MX"
  zone_id = data.terraform_remote_state.domain.outputs.zone_id
  ttl     = 3600

  for_each = local.mx

  weighted_routing_policy {
    weight = each.value
  }

  records = [each.key]
}
