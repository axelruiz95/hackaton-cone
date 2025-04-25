# 🌐 Proyecto Hackathon – Plataforma Nativa en la Nube para Inclusión Financiera

## 🧭 Descripción General

Este proyecto es una plataforma serverless diseñada para impulsar la inclusión financiera mediante una arquitectura escalable, segura y automatizada sobre servicios de AWS. Aprovecha tecnologías modernas de contenedores, monitoreo, seguridad e infraestructura como código, integrando flujos DevOps y eventos en tiempo real.

---

## 🏗️ Arquitectura General

La solución se divide en los siguientes componentes clave:

### 📦 **Aplicación**
- **Backend**: Microservicios construidos en **Java (Spring Boot)** y orquestados en contenedores con **AWS Fargate** y **Kubernetes (EKS)**.
- **Frontend**: Aplicación React entregada mediante **Amazon CloudFront**.
- **Orquestación de Eventos**: Gestión asincrónica con servicios de eventos (posiblemente **Amazon EventBridge** o **SNS/SQS**).

### 🔐 **Seguridad**
- **AWS Cognito**: Autenticación y autorización de usuarios.
- **AWS Shield**: Protección ante ataques DDoS.
- **AWS CloudHSM**: Gestión de claves criptográficas de alto nivel.

### 🗃️ **Almacenamiento**
- **Amazon RDS/Aurora**: Base de datos relacional.
- **Amazon DynamoDB**: Almacenamiento NoSQL para alta disponibilidad.
- **Amazon S3**: Almacenamiento de objetos estáticos y documentación.

### ⚙️ **Despliegue y Automatización**
- **Terraform**: Provisión de toda la infraestructura como código (IaC).
- **Jenkins + Python**: Pipeline CI/CD ejecutado en instancias EC2, con scripts personalizados para integración de backend y pruebas automatizadas.

### 🔍 **Monitoreo**
- **Amazon CloudWatch**: Métricas, logs y alertas de toda la infraestructura y microservicios.

---

## 🧰 Tecnologías Usadas

| Categoría        | Herramientas y Servicios            |
|------------------|-------------------------------------|
| Frontend         | React, CloudFront                   |
| Backend          | Spring Boot (Java), AWS Fargate, EKS |
| DevOps           | Jenkins, Python, Terraform          |
| Seguridad        | AWS Cognito, Shield, CloudHSM       |
| Almacenamiento   | RDS, DynamoDB, S3                   |
| Monitoreo        | CloudWatch                          |
| Eventos          | EventBridge / SNS / SQS             |

---

## 🚀 Cómo Desplegar

1. Clonar el repositorio:

   - git clone https://github.com/axelruiz95/hackaton-cone.git
   - cd tu-proyecto
   
2. Provisión con Terraform:

terraform init
terraform apply

3. Accede a Jenkins en la EC2 para ejecutar pipelines y desplegar microservicios.

📈 Objetivos del Proyecto
Facilitar el acceso financiero a comunidades subatendidas.

Garantizar escalabilidad con una arquitectura nativa en la nube.

Implementar una solución segura y resiliente ante ataques.

Integrar CI/CD para acelerar despliegues y mantener calidad de código.

Optimizar la observabilidad y monitoreo proactivo.

👥 Equipo de Desarrollo
Nombre: Axel Ruiz

Rol: Arquitecto de Soluciones Cloud

Tecnologías dominadas: AWS, Terraform, DevOps, Backend Java, React

🏁 Estado del Proyecto
✅ MVP Funcional
🛠️ En desarrollo de nuevas features
📦 Preparado para despliegue en entorno de producción


