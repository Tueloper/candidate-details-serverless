module "vpce_endpoints" {
  source                          = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"

  vpc_id                          = aws_vpc.vpc.id
  security_group_ids              = [aws_security_group.vpc_sg.id]

  endpoints = {
    execute-api = {
      service                     = var.vpce_endpoints_execute_api_service
      service_type                = var.vpce_endpoints_execute_api_service_type
      private_dns_enabled         = var.vpce_endpoints_execute_api_private_dns_enabled
      subnet_ids                  = ["${aws_subnet.vpc_private_subnet_1.id}", "${aws_subnet.vpc_private_subnet_2.id}"]
      security_group_ids          = [aws_security_group.vpc_sg.id]
      tags                        = var.vpce_endpoints_execute_api_tags
    }
  }
}
