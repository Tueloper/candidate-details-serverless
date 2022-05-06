resource "aws_security_group" "vpc_sg" {
  name                              = var.vpc_security_group_name
  description                       = var.vpc_security_group_description
  vpc_id                            = aws_vpc.vpc.id

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