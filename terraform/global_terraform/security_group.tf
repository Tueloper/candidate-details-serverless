resource "aws_security_group" "alb_sg" {
  name                              = var.alb_security_group_name
  description                       = var.alb_security_group_description
  vpc_id                            = data.aws_ssm_parameter.vpc_id.value

  dynamic "ingress" {
    iterator                        = port
    for_each                        = var.defaultVpcTrafficPort

    content {
      from_port                     = port.value
      to_port                       = port.value
      protocol                      = var.alb_security_group_protocol
      cidr_blocks                   = var.alb_security_group_default_cidr_blocks
      ipv6_cidr_blocks              = var.alb_security_group_default_cidr_blocks
    }
  }

  dynamic "egress" {
    iterator                        = port
    for_each                        = var.defaultVpcTrafficPort

    content {
      from_port                     = port.value
      to_port                       = port.value
      protocol                      = var.alb_security_group_protocol
      cidr_blocks                   = var.alb_security_group_default_cidr_blocks
      ipv6_cidr_blocks              = var.alb_security_group_egress_cidr_blocks
    }
  }
}

resource "aws_security_group" "ga_sg" {
  name                              = var.ga_security_group_name
  description                       = var.ga_security_group_description
  vpc_id                            = data.aws_ssm_parameter.vpc_id.value

  dynamic "ingress" {
    iterator                        = port
    for_each                        = var.defaultVpcTrafficPort

    content {
      from_port                     = port.value
      to_port                       = port.value
      protocol                      = var.alb_security_group_protocol
      cidr_blocks                   = var.alb_security_group_default_cidr_blocks
      ipv6_cidr_blocks              = var.alb_security_group_default_cidr_blocks
    }
  }

  dynamic "egress" {
    iterator                        = port
    for_each                        = var.defaultVpcTrafficPort

    content {
      from_port                     = port.value
      to_port                       = port.value
      protocol                      = var.alb_security_group_protocol
      cidr_blocks                   = var.alb_security_group_default_cidr_blocks
      ipv6_cidr_blocks              = var.alb_security_group_egress_cidr_blocks
    }
  }
}

resource "aws_security_group_rule" "vpc_ingress_rule_1" {
  type                              = var.security_group_rule_type
  from_port                         = var.security_group_rule_port
  to_port                           = var.security_group_rule_port
  protocol                          = var.alb_security_group_protocol
  source_security_group_id          = aws_security_group.alb_sg.id
  security_group_id                 = data.aws_ssm_parameter.vpc_security_group.value
}
