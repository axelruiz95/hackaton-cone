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

variable "resource_arn" {
  type = any
}

variable "owner" {
  description = "Nombre de quien creo el proyecto"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se creará el Security Group."
  type        = string
}
