# aws-gmail-mx

Nullstone Block standing up gmail forwarding from AWS Route53.

This module supports [DKIM](http://dkim.org/) setup.

## Inputs

- `dkim: object({ name: string, value: string })`
  - This configures DKIM against the root domain.
  - `name` - Use "DNS Host name (TXT record name)" from Google Workspace
  - `value` - Use "TXT record value" from Google Workspace

## Outputs

