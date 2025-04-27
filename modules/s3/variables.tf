variable "name" {
  description = "Nombre principal para recursos."
  type        = string
}

variable "environment" {
  description = "Ambiente donde se despliega (DEV, STG, PRD)."
  type        = string
}

variable "project" {
  description = "Nombre del proyecto."
  type        = string
}

variable "tags" {
  description = "Mapa de tags comunes."
  type        = map(string)
}

variable "owner" {
  description = "Nombre de quien creo el proyecto"
  type        = string
}
