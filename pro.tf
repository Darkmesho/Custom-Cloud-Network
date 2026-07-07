# Provider and Region Configuration
provider "aws" {
  region = "us-east-1"
}

# Defining Private Ip range (VPC)
 resource"aws_vpc" "the_great_wall_of_vpc" {
  cidr_block = "10.0.0.0/16"

# Tag for easier identification through the AWS web 
  tags = {
    name = "the_great_wall_of_vpc"
  }
}

# Creating subnet for servers 
resource "aws_subnet" "server_subnet" {
  vpc_id = aws_vpc.the_great_wall_of_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# Gateway creation
resource "aws_internet_gateway" "Ark_igw" {
  vpc_id = aws_vpc.the_great_wall_of_vpc.id
  
  tags = {
    name = "sandbox-igw"
  }
}

# Connecting the gateway through route table
resource "aws_route_table" "layout_route_table" {
  vpc_id = aws_vpc.the_great_wall_of_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Ark_igw.id
  }

  tags = {
    name = "layout_route_table"
  }
}

# Associating the route table with our subnet
resource "aws_route_table_association" "Keshta_association" {
  subnet_id = aws_subnet.server_subnet.id
  route_table_id = aws_route_table.layout_route_table.id
}
