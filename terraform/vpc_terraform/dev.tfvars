app                                                  = "tenent"

# parameters
vpc_id_parameter_name                                = "/dev/vpc_id"
vpc_endpoints_execute_parameter_name                 = "/dev/vpce_endpoint_execute_api"
public_subnets_parameter_name                        = "/dev/public_subnets"
vpc_security_group_parameter_name                    = "/dev/vpc_security_group"
network_interface_ips_parameter_name                 = "/dev/network_interface_ips"

# security groups
alb_security_group_protocol                          = "all"
alb_security_group_default_cidr_blocks               = ["0.0.0.0/0"]
alb_security_group_egress_cidr_blocks                = ["::/0"]
vpc_security_group_name                              = "vpc_sg"
vpc_security_group_description                       = "Security group for tenant VPC"

# vpc-endpoints
vpce_endpoints_execute_api_service                   = "execute-api"
vpce_endpoints_execute_api_service_type              = "Interface"
vpce_endpoints_execute_api_private_dns_enabled       = true
vpce_endpoints_execute_api_tags                      = {
    Name                                                    = "execute-api_vpc_endpoint"
}

# vpc configs
vpc_cidr_block                                       = "10.0.0.0/16"
vpc_instance_tenancy                                 = "default"
vpc_enable_dns_support                               = true
vpc_enable_dns_hostnames                             = true
vpc_enable_classiclink                               = false
vpc_tags = {
    Name                                                    = "vpc"
    staticIp                                                = true
}
vpc_subnet_public_1_cidr_block                       = "10.0.1.0/24"
vpc_subnet_public_1_availability_zone                = "us-east-1a"
vpc_map_public_ip_on_launch                          = true
vpc_subnet_public_1_tags                             = {
    Name                                                    = "vpc_public_subnet_1"
}
vpc_subnet_public_2_cidr_block                       = "10.0.2.0/24"
vpc_subnet_public_2_availability_zone                = "us-east-1b"
vpc_subnet_public_2_tags                             = {
    Name                                                    = "vpc_public_subnet_2"
}
vpc_subnet_private_1_cidr_block                      = "10.0.4.0/24"
vpc_subnet_private_1_availability_zone               = "us-east-1a"
vpc_map_public_ip_on_launch_false                    = false
vpc_subnet_private_1_tags                            = {
    Name                                                    = "vpc_private_subnet_1"
}
vpc_subnet_private_2_cidr_block                      = "10.0.5.0/24"
vpc_subnet_private_2_availability_zone               = "us-east-1b"
vpc_subnet_private_2_tags                            = {
    Name                                                    = "vpc_private_subnet_2"
}
internet_gateway_tag                                 = {
    Name                                                    = "vpc_gw"
}
route_table_cidr_block                               = "0.0.0.0/0"
public_route_table_tags                              = {
    Name                                                    = "vpc_public_route_table"
}
private_route_table_tags_1                           = {
    Name                                                    = "vpc_private_route_table_1"
}
private_route_table_tags_2                           = {
    Name                                                    = "vpc_private_route_table_2"
}
