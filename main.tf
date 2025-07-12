provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "ec2" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t3.micro"
    tags = {
      Name = "My boobs"
    }
  
}