terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
  }
}

data "ns_workspace" "this" {}

data "ns_connection" "domain" {
  name = "domain"
  type = "domain/aws"
}

locals {
  domain_name = trimsuffix(data.ns_connection.domain.outputs.fqdn, ".")
}
