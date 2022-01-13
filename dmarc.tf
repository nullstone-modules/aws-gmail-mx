locals {
  dmarc_emails = tolist([for item in var.dmarc_reports_email : "${item}@${local.domain_name}"])
  rua          = length(local.dmarc_emails) > 0 ? "; rua=mailto:${join(",", local.dmarc_emails)}" : ""
}

resource "aws_route53_record" "dmarc" {
  zone_id = data.ns_connection.domain.outputs.zone_id
  name    = "_dmarc"
  type    = "TXT"
  ttl     = 3600
  // 'p=quarantine' sets aside questionable emails for further processing, which are usually exiled to the “Junk” folder.
  // rua configures dmarc reports
  records = ["v=DMARC1; p=quarantine${local.rua}"]
}
