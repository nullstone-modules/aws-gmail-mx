variable "dkim" {
  type = object({
    name : string
    value : string
  })

  default = {
    name  = ""
    value = ""
  }

  description = <<EOF
DKIM (DomainKeys Identified Mail) allows you to authenticate outgoing emails from a server to prevent emails from being marked as spam.
This variable is intended to configure gmail to be authorized to send outgoing email.
To generate this value, visit Google Workspace > Settings for Gmail > Authenticate email, click "Generate New Record".
EOF
}

variable "dmarc_reports_email" {
  type    = list(string)
  default = ["dmarc-reports"]

  description = <<EOF
Email address to receive reports about DMARC activity for your domain.
This module will add 'mailto:' prefix and '@<domain>' suffix to the specified value.
To send to multiple emails, add a comma.
To turn off, specify an empty list.
Do not use a personal email address for this.
EOF
}
