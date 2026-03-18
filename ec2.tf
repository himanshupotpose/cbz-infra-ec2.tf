provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my_ec2_instance" {
    ami = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
    key_name = "dell"
    vpc_security_group_ids = ["sg-0843a7cb09cfe1125"]
    tags = {
        Name = "my_ec2_instance"
        env = "dev"
    }
}