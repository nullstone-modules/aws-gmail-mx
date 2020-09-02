variable "owner_id" {
  type = string
}

variable "stack_name" {
  type = string
}

variable "env" {
  type = string
}

variable "block_name" {
  type = string
}

variable "parent_blocks" {
  type = object({
    domain : string
  })
}

variable "backend_conn_str" {
  type = string
}


locals {
  full_name = "${var.stack_name}-${var.env}-${var.block_name}"
}


variable "mx-records" {
  type = list(object({
    weight: number
    record: string
  }))

  default = [
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