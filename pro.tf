# at here we wrote the provider and the region of servers

provider"aws"{

region = "us-east-1"

}

# at here we wrote the first resource  and the type and name the and area  of the net
 
resource"aws_vpc" "the_great_wall_of_vpc"{

cidr="10.0.0.0/16"

}

#we make a new resource with name my.... 

resource "aws_subnet" "my subnet"{

vpc_id=aws_vpc.the_great_wall_of_vpc.id

#we tell him to get the id of VPC  from above

cidr_block = "10.0.1.0/24"

map_public_ip_on_lanch=true
}
# this line make  the server take  any ip  to make it seen on the internet

resource "aws_internet_gateway" "my_ige"{
# make a gate
vpc_id = aws_vpc.the_great_wall_of_vpc.id
}

resource"aws_route_table" "my_routetable"{

vpc_id =aws_vpc.the_great_wall_of_vpc.id

route{
cidr_block ="0.0.0.0/0"
gateway_id =aws_internet_gateway.my_igw.id
}
}

