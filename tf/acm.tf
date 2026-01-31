resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  subject_alternative_names = ["*.${var.domain_name}"]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "dylanmaus_cert"
  }
}

# Find the hosted zone ID (assumes it already exists)
data "aws_route53_zone" "primary" {
  name = "${var.domain_name}."
}

# Create DNS records to validate the ACM certificate
resource "aws_route53_record" "cert_validation" {
  provider = aws.us_east_1 # ACM record validation must be in us-east-1 as well

  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = data.aws_route53_zone.primary.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}

# Wait for certificate validation
resource "aws_acm_certificate_validation" "cert_validation" {
  provider            = aws.us_east_1
  certificate_arn     = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
