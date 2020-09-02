resource "aws_route53_record" "main" {
  name    = ""
  type    = "MX"
  zone_id = data.terraform_remote_state.domain.outputs.zone_id
  ttl     = 3600

  for_each = var.mx-records

  weighted_routing_policy {
    weight = each.value.weight
  }

  records = [each.value.record]
}
