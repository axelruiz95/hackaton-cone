resource "aws_cloudfront_distribution" "aws_cloudfront" {
  origin {
    domain_name = var.s3_bucket_regional_domain_name
    origin_id   = "s3-origin"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-origin"

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-cloudfront"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}
