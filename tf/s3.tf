resource "aws_s3_bucket" "website_bucket" {
  bucket = var.domain_name # S3 bucket name often matches the domain name for clarity
}

# Enforce S3 bucket security best practices
resource "aws_s3_bucket_public_access_block" "website_bucket_access_block" {
  bucket = aws_s3_bucket.website_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
