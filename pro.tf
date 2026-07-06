# the first of all we want to build a compound  project so the first we will take a peace of land "provider" second we make the walls "vpc"
#






# at here we wrote the provider and the region of servers

provider"aws"{

region = "us-east-1"

}

# at here we wrote the first resource  and the type and name the and area  of the net
 
resource"aws_vpc" "the_great_wall_of_vpc"{

cidr_block="10.0.0.0/16"

}

#we make a new resource with name my.... 

resource "aws_subnet" "my_subnet"{

vpc_id=aws_vpc.the_great_wall_of_vpc.id

#we tell him to get the id of VPC  from above

cidr_block = "10.0.1.0/24"

map_public_ip_on_launch=true
}
# this line make  the server take  any ip  to make it seen on the internet

resource "aws_internet_gateway" "my_igw"{
# make a gate
vpc_id = aws_vpc.the_great_wall_of_vpc.id
}

resource"aws_route_table" "my_routetable"{

vpc_id =aws_vpc.the_great_wall_of_vpc.id

route{
# it is an inner block  that we put the base on it 
cidr_block ="0.0.0.0/0"
# any id from the internet
gateway_id =aws_internet_gateway.my_igw.id
# tell the 
}
}
resource " aws_route_table_association" "my_association"{
subnet_id = aws_subnet.my_subnet.id
route_table_id =aws_route_table.my_routetable.id
}
