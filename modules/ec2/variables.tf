variable "name" {
  description = "Nombre principal del proyecto."
  type        = string
}

variable "environment" {
  description = "Ambiente donde corre (DEV, STG, PRD)."
  type        = string
}

variable "project" {
  description = "Nombre del proyecto."
  type        = string
}

variable "tags" {
  description = "Tags globales."
  type        = map(string)
}

variable "owner" {
  description = "Nombre de quien creo el proyecto"
  type        = string
}

variable "ami_id" {
  description = "AMI Ubuntu."
  type        = string
}

variable "instance_type" {
  description = "Tamaño de la instancia EC2."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID donde desplegar EC2."
  type        = string
}

variable "key_name" {
  description = "Nombre del par de llaves SSH."
  type        = string
}

variable "security_group_id" {
  description = "Security Group para permitir tráfico."
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se creará el Security Group."
  type        = string
}
