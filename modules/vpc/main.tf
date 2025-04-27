resource "aws_vpc" "aws_vpc" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-${var.environment}-${var.name}-vpc"
    }
  )
}

resource "aws_internet_gateway" "aws_intergateway" {
  vpc_id = aws_vpc.aws_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-${var.environment}-${var.name}-igw"
    }
  )
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.aws_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-${var.environment}-${var.name}-public-${count.index}"
    }
  )
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.aws_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-${var.environment}-${var.name}-private-${count.index}"
    }
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_intergateway.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-${var.environment}-${var.name}-public-rt"
    }
  )
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
