resource "aws_vpc" "network" {
    cidr_block = var.vpc_cidr 
    tags = {
        Name = "network"
    }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.network.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "App-1-private"
    }
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.network.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "App-1-public"
    }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.network.id
    tags = {
        Name = "App_igw"
    }
}
resource "aws_route_table" "General_vpc_rt" {
    vpc_id = aws_vpc.network.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "public_acc_interner"
    }
}
resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.General_vpc_rt.id
  
}
resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.General_vpc_rt.id
  
}
resource "aws_security_group" "ssh_allowed" {
    vpc_id = aws_vpc.network.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {

    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
    tags = {
        Name = "ssh-allowed"
    }
}
resource "aws_instance" "ec2_instance" {
  count                  = 4
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance
  key_name               = "NewInstance"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = ["${aws_security_group.ssh_allowed.id}"]
  tags = {
    Name = element(var.instance_tags, count.index)
  }
  
}