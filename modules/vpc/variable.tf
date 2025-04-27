variable "name" {
  description = "Nombre principal del owner."
  type        = string
}

variable "environment" {
  description = "Ambiente de despliegue (DEV, STG, PRD)."
  type        = string
}

variable "project" {
  description = "Nombre del proyecto."
  type        = string
}

variable "tags" {
  description = "Tags comunes."
  type        = map(string)
}

variable "vpc_cidr" {
  description = "CIDR block principal de la VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDRs para subnets públicas."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de CIDRs para subnets privadas."
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad."
  type        = list(string)
}
