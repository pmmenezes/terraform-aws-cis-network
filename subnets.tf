resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.31.1.0/24"

  tags = merge(
    var.default_tags,
    {
      Name = "snet-private"
    }
  )
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.31.2.0/24"

  tags = merge(
    var.default_tags,
    {
      Name = "snet-puvlic"
    }
  )

}

