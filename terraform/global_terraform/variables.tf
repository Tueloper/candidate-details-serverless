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

variable "target_group_name" {}

variable "target_group_port" {}

variable "target_group_protocol" {}

variable "target_group_target_type" {}

variable "target_group_health_check_path" {}

variable "target_group_health_check_interval" {}

variable "target_group_health_check_protocol" {}

variable "target_group_health_check_timeout" {}

variable "target_group_health_check_unhealthy_threshold" {}

variable "target_group_health_check_healthy_threshold" {}

variable "target_group_health_check_matcher" {}

variable "target_group_tags" {}

variable "target_group_attachment_port" {}

variable "alb_name" {}

variable "alb_internal" {}

variable "alb_load_balancer_type" {}

variable "alb_ip_address_type" {}

variable "alb_enable_deletion_protection" {}

variable "alb_access_logs_prefix" {}

variable "alb_access_logs_enabled" {}

variable "alb_tags" {}

variable "alb_listener_port" {}

variable "alb_listener_protocol" {}

variable "alb_ssl_policy" {}

variable "alb_default_action_type" {}

variable "data_s3_bucket_policy_id" {}

variable "data_s3_bucket_statement_actions_PUT" {}

variable "data_s3_bucket_statement_actions_GET" {}

variable "data_s3_bucket_statement_effect" {}

variable "data_s3_bucket_statement_principal_aws_type" {}

variable "data_s3_second_statement_principal_delivery_identifiers" {}

variable "data_s3_bucket_statement_principal_service_type" {}

variable "global_accelerator_name" {}

variable "global_accelerator_ip_address_type" {}

variable "global_accelerator_enabled" {}

variable "global_accelerator_tags" {}

variable "global_accelerator_listener_client_affinity" {}

variable "global_accelerator_protocol" {}

variable "global_accelerator_listener_port" {}

variable "global_accelerator_endpoint_group_weight" {}

variable "global_accelerator_listener_client_ip_preservation_enabled" {}

variable "vpc_id_parameter_name" {}

variable "vpc_endpoints_execute_parameter_name" {}

variable "s3_bucket_force_destroy" {}

variable "alb_security_group_name" {}

variable "alb_security_group_description" {}

variable "alb_security_group_protocol" {}

variable "alb_security_group_default_cidr_blocks" {}

variable "alb_security_group_egress_cidr_blocks" {}

variable "ga_security_group_name" {}

variable "ga_security_group_description" {}

variable "ga_security_group_protocol" {}

variable "vpc_security_group_protocol" {}

variable "security_group_rule_type" {}

variable "security_group_rule_protocol" {}

variable "security_group_rule_port" {}

variable "public_subnets_parameter_name" {}

variable "vpc_security_group_parameter_name" {}

variable "network_interface_ips_parameter_name" {}

variable "custom_domain_record_type" {}

variable "base_mapping_api_path" {}

variable "vpce_endpoint_sercvice" {}
