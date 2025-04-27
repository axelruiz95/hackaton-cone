output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.aws_cloudfront
}

output "cloudfront_distribution_arn" {
  description = "ARN de la distribución de CloudFront"
  value       = aws_cloudfront_distribution.aws_cloudfront.arn
}