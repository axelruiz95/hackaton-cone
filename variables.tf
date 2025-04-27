variable "name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente"
  type        = string
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
}
variable "owner" {
  description = "Nombre de quien creo el proyecto"
  type        = string
}

variable "db_username" {
  description = "Nombre de Usuario para base de datos"
  type        = string
}

variable "db_password" {
  description = "Password para base de datos"
  type        = string
}

# Opcionales que te recomiendo agregar:
variable "region" {
  description = "Región AWS donde desplegar los recursos."
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Conjunto de etiquetas comunes para los recursos."
  type        = map(string)
  default     = {}
}

variable "subnet_ids" {
  description = "Lista de Subnet IDs donde vive el EKS."
  type        = list(string)
  default     = []
}