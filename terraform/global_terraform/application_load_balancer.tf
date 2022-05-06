resource "aws_lb_target_group" "tg" {
    name                    = var.target_group_name
    port                    = var.target_group_port
    protocol                = var.target_group_protocol
    target_type             = var.target_group_target_type
    vpc_id                  = data.aws_ssm_parameter.vpc_id.value

    health_check {
        path                = var.target_group_health_check_path
        interval            = var.target_group_health_check_interval
        protocol            = var.target_group_health_check_protocol
        timeout             = var.target_group_health_check_timeout
        healthy_threshold   = var.target_group_health_check_healthy_threshold
        unhealthy_threshold = var.target_group_health_check_unhealthy_threshold
        matcher             = var.target_group_health_check_matcher
    }

    tags                    = var.target_group_tags
}

resource "aws_lb_target_group_attachment" "tg_attachments" {
    for_each                = data.aws_network_interface.vpce_endpoints_api_ips
    target_group_arn        = aws_lb_target_group.tg.arn
    target_id               = each.value.private_ip
    port                    = var.target_group_attachment_port
}

resource "aws_lb" "alb" {
    name                    = var.alb_name
    internal                = var.alb_internal
    subnets                 = nonsensitive(split(",", data.aws_ssm_parameter.public_subnets.value))

    load_balancer_type      = var.alb_load_balancer_type
    ip_address_type         = var.alb_ip_address_type
    security_groups         = [aws_security_group.alb_sg.id]

    access_logs {
        bucket                = aws_s3_bucket.alb_logs.bucket
        prefix                = var.alb_access_logs_prefix
        enabled               = var.alb_access_logs_enabled
    }

    tags = var.alb_tags
}

resource "aws_lb_listener" "api_listener" {
    load_balancer_arn          = aws_lb.alb.arn
    port                       = var.alb_listener_port
    protocol                   = var.alb_listener_protocol
    ssl_policy                 = var.alb_ssl_policy
    certificate_arn            = var.certificateArn
    default_action {
        target_group_arn       = aws_lb_target_group.tg.arn
        type                   = var.alb_default_action_type
    }
}
