variable "name" {
  description = "Nombre principal para proyecto."
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

variable "db_username" {
  description = "Nombre de Usuario para base de datos"
  type        = string
}

variable "db_password" {
  description = "Password para base de datos"
  type        = string
}


