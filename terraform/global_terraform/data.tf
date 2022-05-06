data "aws_ssm_parameter" "vpc_id" {
  name                = var.vpc_id_parameter_name
}

data "aws_ssm_parameter" "vpce_endpoints_execute_api" {
  name                = var.vpc_endpoints_execute_parameter_name
}

data "aws_ssm_parameter" "public_subnets" {
  name                = var.public_subnets_parameter_name
}

data "aws_ssm_parameter" "vpc_security_group" {
  name                = var.vpc_security_group_parameter_name
}

data "aws_ssm_parameter" "network_interface_ips" {
  name                = var.network_interface_ips_parameter_name
}

data "aws_route53_zone" "domain_zone" {
  name                = var.domain
  private_zone        = false
}

data "aws_api_gateway_rest_api" "tenant" {
  name                = "${var.stage}-${var.app}"
}

data "aws_vpc_endpoint" "execute-api" {
  vpc_id              = data.aws_ssm_parameter.vpc_id.value
  service_name        = "com.amazonaws.us-east-1.execute-api"
}

data "aws_network_interface" "vpce_endpoints_api_ips" {
  for_each            = data.aws_vpc_endpoint.execute-api.network_interface_ids
  id                  = each.value
}

data "aws_iam_policy_document" "s3_bucket_alb_write" {
  policy_id           = var.data_s3_bucket_policy_id

  statement {
    actions           = var.data_s3_bucket_statement_actions_PUT
    effect            = var.data_s3_bucket_statement_effect
    resources         = [
      "${aws_s3_bucket.alb_logs.arn}/*",
    ]

    principals {
      identifiers     = [data.aws_elb_service_account.elb_account.arn]
      type            = var.data_s3_bucket_statement_principal_aws_type
    }
  }

  statement {
    actions           = var.data_s3_bucket_statement_actions_PUT
    effect            = var.data_s3_bucket_statement_effect
    resources         = ["${aws_s3_bucket.alb_logs.arn}/*"]
    principals {
      identifiers     = var.data_s3_second_statement_principal_delivery_identifiers
      type            = var.data_s3_bucket_statement_principal_service_type
    }
  }


  statement {
    actions           = var.data_s3_bucket_statement_actions_GET
    effect            = var.data_s3_bucket_statement_effect
    resources         = [aws_s3_bucket.alb_logs.arn]
    principals {
      identifiers     = var.data_s3_second_statement_principal_delivery_identifiers
      type            = var.data_s3_bucket_statement_principal_service_type
    }
  }
}

data "aws_elb_service_account" "elb_account" {}
