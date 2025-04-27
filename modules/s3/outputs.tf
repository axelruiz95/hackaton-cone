output "bucket_name" {
  description = "Nombre bucket"
  value       = aws_s3_bucket.s3_h_cone.id
}

output "bucket_regional_domain_name" {
  description = "El nombre de dominio regional del bucket S3."
  value       = aws_s3_bucket.s3_h_cone.bucket_domain_name
}