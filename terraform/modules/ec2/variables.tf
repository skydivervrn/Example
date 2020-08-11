variable "add_volume" {
  type = bool
  default = false
}

variable "instance_ami_id" {
  type = string
  default = "ami-6e28b517"
}

variable "instances_count" {
  type = number
}

variable "instance_availability_zones_mapping" {
  type = list(string)
}

variable "instance_key_name" {
  type = string
}

variable "base_name" {
  type = string
  default = ""
}

variable "instance_storage_size" {
  type = number
  default = 8
}

variable "instance_tags" {
  type = map(string)
}

variable "instance_type" {
  type = string
}

variable "instance_root_device_size" {
  type = number
  default = 8
}

variable "instance_storage_type" {
  type = string
  default = "gp2"
}

variable "instance_subnets_mapping" {
  type = list(string)
}

variable "instance_volume_tags" {
  type = map(string)
  default = {}
}

variable "instance_vpc_security_group_ids" {
  type = list(string)
}

variable "policy_arn_list" {
  type = list(string)
  default = []
}
variable "prevent_destroy" {
  type = bool
  default = true
}
