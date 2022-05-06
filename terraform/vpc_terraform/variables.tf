variable "app" {
  default =  "tenant"
}
variable "AWS_REGION" {    
    default = "us-east-1"
}

variable "defaultVpcTrafficPort" {
  type = list(number)
  default = [ 443 ]
}

variable "albTrafficPort" {
  type = list(number)
  default = [ 443 ]
}

variable "region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "AWS_ACCOUNT_ID" {}

variable "stage" {
  type = string
}

variable "certificateArn" {
  type = string
}

variable "domain" {
    type = string
}

variable "alb_security_group_protocol" {}

variable "alb_security_group_default_cidr_blocks" {}

variable "alb_security_group_egress_cidr_blocks" {}

variable "vpc_security_group_name" {}

variable "vpce_endpoints_execute_api_service" {}

variable "vpce_endpoints_execute_api_service_type" {}

variable "vpce_endpoints_execute_api_private_dns_enabled" {}

variable "vpce_endpoints_execute_api_tags" {}

variable "vpc_cidr_block" {}

variable "vpc_instance_tenancy" {}

variable "vpc_enable_dns_support" {}

variable "vpc_enable_classiclink" {}

variable "vpc_tags" {}

variable "vpc_subnet_public_1_cidr_block" {}

variable "vpc_subnet_public_1_availability_zone" {}

variable "vpc_map_public_ip_on_launch" {}

variable "vpc_subnet_public_1_tags" {}

variable "vpc_subnet_public_2_cidr_block" {}

variable "vpc_subnet_public_2_availability_zone" {}

variable "vpc_subnet_public_2_tags" {}

variable "vpc_subnet_private_1_cidr_block" {}

variable "vpc_subnet_private_1_availability_zone" {}

variable "vpc_map_public_ip_on_launch_false" {}

variable "vpc_subnet_private_1_tags" {}

variable "vpc_subnet_private_2_cidr_block" {}

variable "vpc_subnet_private_2_availability_zone" {}

variable "vpc_subnet_private_2_tags" {}

variable "internet_gateway_tag" {}

variable "route_table_cidr_block" {}

variable "public_route_table_tags" {}

variable "private_route_table_tags_1" {}

variable "private_route_table_tags_2" {}

variable "vpc_enable_dns_hostnames" {}

variable "vpc_security_group_description" {}

variable "network_interface_ips_parameter_name" {}

variable "vpc_security_group_parameter_name" {}

variable "public_subnets_parameter_name" {}

variable "vpc_id_parameter_name" {}

variable "vpc_endpoints_execute_parameter_name" {}
