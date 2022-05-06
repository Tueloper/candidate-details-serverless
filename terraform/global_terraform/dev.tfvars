app                                                  = "app"
target_group_name                                    = "tg"
target_group_port                                    = 443
target_group_protocol                                = "HTTPS"
target_group_target_type                             = "ip"
target_group_health_check_path                       = "/"
target_group_health_check_interval                   = 30
target_group_health_check_protocol                   = "HTTPS"
target_group_health_check_timeout                    = 5
target_group_health_check_healthy_threshold          = 5
target_group_health_check_unhealthy_threshold        = 2
target_group_health_check_matcher                    = 403
target_group_tags                                    = { Name = "tg" }
target_group_attachment_port                        = 443

# application load balancer
alb_name                                             = "alb"
alb_internal                                         = false
alb_load_balancer_type                               = "application"
alb_ip_address_type                                  = "ipv4"
alb_enable_deletion_protection                       = true
alb_access_logs_prefix                               = "alb"
alb_access_logs_enabled                              = true
alb_tags                                             = {
    Name                                                    = "alb"
}
alb_listener_port                                    = 443
alb_listener_protocol                                = "HTTPS"
alb_ssl_policy                                       = "ELBSecurityPolicy-2016-08"
alb_default_action_type                              = "forward"

# data sources
data_s3_bucket_policy_id                             = "s3_bucket_alb_logs"
data_s3_bucket_statement_actions_PUT                 = ["s3:PutObject"]
data_s3_bucket_statement_actions_GET                 = ["s3:GetBucketAcl"]
data_s3_bucket_statement_effect                      = "Allow"
data_s3_bucket_statement_principal_aws_type          = "AWS"
data_s3_second_statement_principal_delivery_identifiers = ["delivery.logs.amazonaws.com"]
data_s3_bucket_statement_principal_service_type      = "Service"

# global accelerators
global_accelerator_name                              = "global-accelerator"
global_accelerator_ip_address_type                   = "IPV4"
global_accelerator_enabled                           = true
global_accelerator_tags                              = {
    Name                                                    = "global-accelerator"
}
global_accelerator_listener_client_affinity          = "NONE"
global_accelerator_protocol                          = "TCP"
global_accelerator_listener_port                     = 443
global_accelerator_endpoint_group_weight             = 255
global_accelerator_listener_client_ip_preservation_enabled = true

# s3buckets
s3_bucket_force_destroy                              = true

# security groups
alb_security_group_name                              = "alb_sg"
alb_security_group_description                       = "Security group for tenant application load balancer"
alb_security_group_protocol                          = "all"
alb_security_group_default_cidr_blocks               = ["0.0.0.0/0"]
alb_security_group_egress_cidr_blocks                = ["::/0"]
ga_security_group_name                               = "ga_sg"
ga_security_group_description                        = "Security group for tenant global accelerator"
ga_security_group_protocol                           = "all"
vpc_security_group_protocol                          = "all"
security_group_rule_type                             = "ingress"
security_group_rule_protocol                         = "all"
security_group_rule_port                             = 443

# parameters
vpc_id_parameter_name                                = "/tenant/dev/vpc_id"
vpc_endpoints_execute_parameter_name                 = "/tenant/dev/vpce_endpoint_execute_api"
public_subnets_parameter_name                        = "/tenant/dev/public_subnets"
vpc_security_group_parameter_name                    = "/tenant/dev/vpc_security_group"
network_interface_ips_parameter_name                 = "/tenant/dev/network_interface_ips"

# custom domain
base_mapping_api_path                                = "api"
vpce_endpoint_sercvice                               = "com.amazonaws.us-east-1.execute-api"
custom_domain_record_type                            = "A"
