# at here we wrote the provider and the region of servers
provider"aws"{
region = "us-east-1"
}

# at here we wrote the first resource  and the type 
resource"aws_vpc" "the great wall of vpc"{

cidr="10.0.0.0/16"

}
