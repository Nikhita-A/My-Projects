# create a vpc
resource "aws_vpc" "my_terraform_project_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "my_terraform_project_vpc"
  }
}

# create two subnets
resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_names)
  vpc_id                  = aws_vpc.my_terraform_project_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.subnet_azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [aws_vpc.my_terraform_project_vpc]
}

# create an internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_terraform_project_vpc.id
  tags = {
    Name = "my_terraform_project_igw"
  }
  depends_on = [aws_vpc.my_terraform_project_vpc]
}

# create a route table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_terraform_project_vpc.id

  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.igw.id
  }
  depends_on = [aws_vpc.my_terraform_project_vpc]
}

# associate route table to subnet 1
resource "aws_route_table_association" "rta_subnet1" {
  subnet_id      = aws_subnet.subnets[0].id
  route_table_id = aws_route_table.my_rt.id
}

# associate route table to subnet 2
resource "aws_route_table_association" "rta_subnet2" {
  subnet_id      = aws_subnet.subnets[1].id
  route_table_id = aws_route_table.my_rt.id
}