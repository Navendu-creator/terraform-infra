resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = merge({ Name = var.vpc_name }, var.tags)
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = length(var.azs) > 0 ? element(var.azs, count.index) : null
  map_public_ip_on_launch = true
  tags = merge(var.tags, { "kubernetes.io/role/elb" = "1" })
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = length(var.azs) > 0 ? element(var.azs, count.index) : null
  tags = merge(var.tags, { "kubernetes.io/role/internal-elb" = "1" })
}

# Note: NAT and Internet Gateway resources should be added for production as required.
# For production-grade, consider NAT gateway per AZ, route tables, and egress controls.
