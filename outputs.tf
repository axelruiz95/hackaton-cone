output "vpc_id" {
  description = "ID de la VPC principal."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las Subnets públicas."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las Subnets privadas."
  value       = module.vpc.private_subnet_ids
}

output "s3_bucket_name" {
  description = "Nombre del Bucket S3 principal."
  value       = module.s3.bucket_name
}

output "dynamodb_table_name" {
  description = "Nombre de la Tabla DynamoDB principal."
  value       = module.dynamodb.table_name
}

output "rds_endpoint" {
  description = "Endpoint de la instancia RDS."
  value       = module.rds.endpoint
}

output "eks_cluster_name" {
  description = "Nombre del Cluster EKS."
  value       = module.eks.cluster_name
}

output "ec2_public_ip" {
  description = "IP pública de la instancia EC2 (Jenkins server)."
  value       = module.jenkins_ec2.public_ip
}

output "cloudfront_distribution_domain" {
  description = "Dominio de CloudFront para acceder al contenido distribuido."
  value       = module.networking.cloudfront_domain_name
}

output "eventbridge_bus_name" {
  description = "Nombre del bus de eventos EventBridge."
  value       = module.eventbridge.event_bus_name
}
