# Internet VPC
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc_cidr_block
  instance_tenancy        = var.vpc_instance_tenancy
  enable_dns_support      = var.vpc_enable_dns_support
  enable_dns_hostnames    = var.vpc_enable_dns_hostnames
  enable_classiclink      = var.vpc_enable_classiclink
  tags                    = var.vpc_tags
}

# Subnets
resource "aws_subnet" "vpc_public_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_subnet_public_1_cidr_block
  map_public_ip_on_launch = var.vpc_map_public_ip_on_launch
  availability_zone       = var.vpc_subnet_public_1_availability_zone
  tags                    = var.vpc_subnet_public_1_tags
}

resource "aws_subnet" "vpc_public_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_subnet_public_2_cidr_block
  map_public_ip_on_launch = var.vpc_map_public_ip_on_launch
  availability_zone       = var.vpc_subnet_public_2_availability_zone
  tags                    = var.vpc_subnet_public_2_tags
}

resource "aws_subnet" "vpc_private_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_subnet_private_1_cidr_block
  map_public_ip_on_launch = var.vpc_map_public_ip_on_launch_false
  availability_zone       = var.vpc_subnet_private_1_availability_zone
  tags                    = var.vpc_subnet_private_1_tags
}

resource "aws_subnet" "vpc_private_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_subnet_private_2_cidr_block
  map_public_ip_on_launch = var.vpc_map_public_ip_on_launch_false
  availability_zone       = var.vpc_subnet_private_2_availability_zone
  tags                    = var.vpc_subnet_private_2_tags
}

# Internet GW
resource "aws_internet_gateway" "vpc_gw" {
  vpc_id                  = aws_vpc.vpc.id
  tags                    = var.internet_gateway_tag
}

# elastic
resource "aws_eip" "vpc_ip_1" {
  depends_on              = [
    aws_internet_gateway.vpc_gw
  ]
}

resource "aws_eip" "vpc_ip_2" {
  depends_on              = [
    aws_internet_gateway.vpc_gw
  ]
}

# nat gateways
resource "aws_nat_gateway" "vpc_ngw_1" {
  allocation_id           = aws_eip.vpc_ip_1.id
  subnet_id               = aws_subnet.vpc_public_subnet_1.id
}

resource "aws_nat_gateway" "vpc_ngw_2" {
  allocation_id           = aws_eip.vpc_ip_2.id
  subnet_id               = aws_subnet.vpc_public_subnet_2.id
}


# route tables
resource "aws_route_table" "vpc_public_route_table" {
  vpc_id                  = aws_vpc.vpc.id
  route {
    cidr_block            = var.route_table_cidr_block
    gateway_id            = aws_internet_gateway.vpc_gw.id
  }

  tags                    = var.public_route_table_tags
}

resource "aws_route_table" "vpc_private_route_table_1" {
  vpc_id                  = aws_vpc.vpc.id
  route {
    cidr_block            =  var.route_table_cidr_block
    nat_gateway_id        = aws_nat_gateway.vpc_ngw_1.id
  }

  tags                    = var.private_route_table_tags_1
}

resource "aws_route_table" "vpc_private_route_table_2" {
  vpc_id                  = aws_vpc.vpc.id
  route {
    cidr_block            = var.route_table_cidr_block
    nat_gateway_id        = aws_nat_gateway.vpc_ngw_2.id
  }

  tags                    = var.private_route_table_tags_2
}

# route associations public
resource "aws_route_table_association" "vpc_public_route_table_1" {
  subnet_id               = aws_subnet.vpc_public_subnet_1.id
  route_table_id          = aws_route_table.vpc_public_route_table.id
}

resource "aws_route_table_association" "vpc_public_route_table_2" {
  subnet_id               = aws_subnet.vpc_public_subnet_2.id
  route_table_id          = aws_route_table.vpc_public_route_table.id
}

resource "aws_route_table_association" "vpc_private_route_table_1" {
  subnet_id                = aws_subnet.vpc_private_subnet_1.id
  route_table_id           = aws_route_table.vpc_private_route_table_1.id
}

resource "aws_route_table_association" "vpc_private_subnet_2" {
  subnet_id                = aws_subnet.vpc_private_subnet_2.id
  route_table_id           = aws_route_table.vpc_private_route_table_2.id
}
