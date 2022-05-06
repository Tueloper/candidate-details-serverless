resource "aws_globalaccelerator_accelerator" "global_accelerator" {
    name                                = var.global_accelerator_name
    ip_address_type                     = var.global_accelerator_ip_address_type
    enabled                             = var.global_accelerator_enabled
    tags                                = var.global_accelerator_tags
}

resource "aws_globalaccelerator_listener" "global_accelerator_listener" {
    accelerator_arn                     = aws_globalaccelerator_accelerator.global_accelerator.id
    client_affinity                     = var.global_accelerator_listener_client_affinity
    protocol                            = var.global_accelerator_protocol

    port_range {
        from_port                       = var.global_accelerator_listener_port
        to_port                         = var.global_accelerator_listener_port
    }
}

resource "aws_globalaccelerator_endpoint_group" "global_accelerator_endpoint_primary" {
    listener_arn                        = aws_globalaccelerator_listener.global_accelerator_listener.id

    endpoint_configuration {
        endpoint_id                     = aws_lb.alb.arn
        weight                          = var.global_accelerator_endpoint_group_weight
        client_ip_preservation_enabled  = var.global_accelerator_listener_client_ip_preservation_enabled
    }
}
