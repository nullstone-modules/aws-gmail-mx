locals {
  records = [
    {
      weight = 1,
      record = "ASPMX.L.GOOGLE.COM",
    },
    {
      weight = 5,
      record = "ALT1.ASPMX.L.GOOGLE.COM",
    },
    {
      weight = 5,
      record = "ALT2.ASPMX.L.GOOGLE.COM"
    },
    {
      weight = 10,
      record = "ALT3.ASPMX.L.GOOGLE.COM"
    },
    {
      weight = 10,
      record = "ALT4.ASPMX.L.GOOGLE.COM"
    },
  ]
}

resource "aws_route53_record" "main" {
  name    = ""
  type    = "MX"
  zone_id = data.terraform_remote_state.domain.outputs.zone_id
  ttl     = 3600

  for_each = local.records

  weighted_routing_policy {
    weight = each.value.weight
  }

  records = [each.value.record]
}
