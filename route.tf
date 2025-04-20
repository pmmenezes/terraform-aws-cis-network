# Create the public route table and associate it with the public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      "Name" = format("%s-public-rt", var.vpc_name, )
    },
    var.default_tags,
  )
}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id

  timeouts {
    create = "5m"
  }
}

# Private Routes



resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    {
      #     "Name" = format("%s-%s-private-rt-%d",var.project_name,var.environment,count.index)
      "Name" = format("%s-private-rt", var.vpc_name)
    },
    var.default_tags,
  )
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id


}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.this.id

}

