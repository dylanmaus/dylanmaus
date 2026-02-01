output "website_url" {
  value = "https://${var.domain_name}"
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}
