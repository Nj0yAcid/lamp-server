resource "aws_vpc" "lamp-server" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "Terraform-vpc"
    env  = "dev"
    Team = "DevOps"
  }
}

resource "aws_internet_gateway" "gwy1" {
  vpc_id = aws_vpc.lamp-server.id
}

# public subnet
resource "aws_subnet" "public1" {
  availability_zone       = "us-east-1a"
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.lamp-server.id
  tags = {
    Name = "public-subnet-1"
    env  = "dev"
  }
}

resource "aws_route_table" "rtpublic" {
  vpc_id = aws_vpc.lamp-server.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gwy1.id
  }
}

resource "aws_route_table_association" "rta3" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rtpublic.id
}