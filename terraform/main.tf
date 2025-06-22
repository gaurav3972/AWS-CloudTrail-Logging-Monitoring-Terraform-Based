provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "trail_logs" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_cloudtrail" "trail" {
  name                          = var.trail_name
  s3_bucket_name                = aws_s3_bucket.trail_logs.bucket
  include_global_service_event_
