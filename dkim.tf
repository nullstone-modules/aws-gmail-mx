locals {
  // AWS does not allow TXT records longer than 255
  // To get around this, you must specify a chunk of 255 with each quoted double-quoted
  // Per Terraform docs, the record is already double-quote
  //   As a result, you must place 2 double-quotes between each chunk
  dkim_chars  = chunklist(split("", try(var.dkim.value, "")), 255)
  dkim_chunks = [for chunk in local.dkim_chars : join("", chunk)]
  dkim_record = join("\"\"", local.dkim_chunks)
}

resource "aws_route53_record" "dkim" {
  zone_id = data.ns_connection.domain.outputs.zone_id
  name    = var.dkim.name
  type    = "TXT"
  ttl     = 3600
  records = [local.dkim_record]

  count = length(local.dkim_record) > 0 ? 1 : 0
}
