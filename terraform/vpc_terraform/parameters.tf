resource "aws_ssm_parameter" "vpc_id" {
  name      = var.vpc_id_parameter_name
  type      = "String"
  overwrite = true
  value     = aws_vpc.vpc.id
}

resource "aws_ssm_parameter" "vpc_endpoints_execute" {
  name      = var.vpc_endpoints_execute_parameter_name
  type      = "String"
  overwrite = true
  value     = module.vpce_endpoints.endpoints.execute-api.id
}

resource "aws_ssm_parameter" "public_subnets" {
  name      = var.public_subnets_parameter_name
  type      = "String"
  overwrite = true
  value     = join(",", [
    aws_subnet.vpc_public_subnet_1.id,
    aws_subnet.vpc_public_subnet_2.id,
  ])
}

resource "aws_ssm_parameter" "vpc_security_group" {
  name      = var.vpc_security_group_parameter_name
  type      = "String"
  overwrite = true
  value     = aws_security_group.vpc_sg.id
}

resource "aws_ssm_parameter" "network_interface_ips" {
  name      = var.network_interface_ips_parameter_name
  type      = "String"
  overwrite = true
  value     = join(",", module.vpce_endpoints.endpoints.execute-api.network_interface_ids)
}
