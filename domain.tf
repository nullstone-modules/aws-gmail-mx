data "ns_connection" "domain" {
  name     = "domain"
  type     = "domain/aws"
  contract = "domain/aws/route53"
}

locals {
  domain_name = trimsuffix(data.ns_connection.domain.outputs.fqdn, ".")
}
