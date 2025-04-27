variable "name" {
  description = "Nombre principal del proyecto."
  type        = string
}

variable "environment" {
  description = "Ambiente (DEV, STG, PRD)."
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
variable "owner" {
  description = "Nombre de quien creo el proyecto"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de Subnet IDs donde vive el EKS."
  type        = list(string)
}
