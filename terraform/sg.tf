module "vpc" {
  source = "../vpc"
}

resource "aws_security_group" "webSG" {
  vpc_id = module.vpc.vpc_id
  name = "Allow all inbound traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.webTrafficRule

    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.webTrafficRule

    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "security_groups_name" {
  value = aws_security_group.webSG.name
}
