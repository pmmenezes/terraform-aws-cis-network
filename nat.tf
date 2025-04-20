resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name = format("%s-igw", var.vpc_name)
    },
    var.default_tags,
  )
  timeouts {
    create = "5m"
  }
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [aws_vpc.main]
}



################################################################################
# NAT Gateway
################################################################################

# Create an Elastic IP for the NAT Gateway

resource "aws_eip" "nat" {
  domain = "vpc"
  tags = merge(
    {
      "Name" = format("%s-nat-eip", var.vpc_name)
    },
    var.default_tags,
  )

  depends_on = [aws_internet_gateway.this]
}


resource "aws_nat_gateway" "this" {

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  tags = merge(
    {
      "Name" = format("%s-nat-gw", var.vpc_name)
    },
    var.default_tags,
  )

  depends_on = [aws_internet_gateway.this]
}