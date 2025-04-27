resource "aws_s3_bucket" "s3_h_cone" {
  bucket = "ffs-dev-hackatone-capitl-one-bucket"

  tags = merge(
    var.tags,
    {
      Name = "${var.name}"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}

resource "aws_s3_bucket_versioning" "s3_version" {
    bucket = aws_s3_bucket.s3_h_cone.id

    versioning_configuration {
      status = "Enabled"
    }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_ecrypt" {
    bucket = aws_s3_bucket.s3_h_cone.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }  
}