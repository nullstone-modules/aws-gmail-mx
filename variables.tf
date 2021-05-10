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
