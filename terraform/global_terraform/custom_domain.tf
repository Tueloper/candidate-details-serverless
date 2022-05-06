resource "aws_api_gateway_domain_name" "custom_domain" {
  domain_name                   = "${var.app}.${var.domain}"
  regional_certificate_arn      = var.certificateArn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_route53_record" "tenant-record" {
  name                          = aws_api_gateway_domain_name.custom_domain.domain_name
  type                          = var.custom_domain_record_type
  zone_id                       = data.aws_route53_zone.domain_zone.zone_id

  alias {
    evaluate_target_health      = true
    name                        = aws_globalaccelerator_accelerator.global_accelerator.dns_name
    zone_id                     = aws_globalaccelerator_accelerator.global_accelerator.hosted_zone_id
  }
}

resource "aws_api_gateway_base_path_mapping" "tenant-api-path" {
  api_id                        = data.aws_api_gateway_rest_api.tenant.id
  stage_name                    = var.stage
  domain_name                   = aws_api_gateway_domain_name.custom_domain.domain_name
  base_path                     = var.base_mapping_api_path
}
