# aws-gmail-mx

Nullstone Block standing up gmail forwarding from AWS Route53.

This module configures:
- [SPF](https://support.google.com/a/answer/33786?hl=en)
- [DMARC](https://support.google.com/a/answer/2466580?hl=en)
- [DKIM](https://support.google.com/a/answer/174124?hl=en)

Follow Google's [Set up DKIM to prevent email spoofing](https://support.google.com/a/answer/174124?hl=en) to generate DKIM values.

## Inputs

- `dkim: object({ name: string, value: string })`
  - This configures DKIM against the root domain.
  - `name` - Use "DNS Host name (TXT record name)" from Google Workspace
  - `value` - Use "TXT record value" from Google Workspace

## Outputs

