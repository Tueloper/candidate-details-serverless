resource "aws_eip" "elastic" {
  instance = var.vpc_id
}

output "public_ip" {
  value = aws_eip.elastic.public_ip
}
