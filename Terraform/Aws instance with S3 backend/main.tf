
resource "aws_vpc" "TerraformTestVpc" {

    cidr_block = var.vpc_cider

    tags = var.vpc_tags
}
resource "aws_subnet" "awsSubnetTest" {
    vpc_id            = aws_vpc.my_vpc.id
    cidr_block        = var.subnet_cidr
    availability_zone = "us-east-1"

    tags = var.subnet_tags
}
resource "aws_instance" "Terraform_instance" {

    ami           = var.ec2_ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.awsSubnetTest.id

    tags = var.ec2_tags
  
}