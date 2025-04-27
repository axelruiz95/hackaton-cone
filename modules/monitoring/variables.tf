variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "project" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "owner" {
  type = string
}

variable "ec2_instance_id" {
  type = string
}