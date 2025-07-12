provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "ec2" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t3.micro"

    vpc_security_group_ids = [ aws_security_group.instance_sg.id ]

    user_data = <<-EOF
                  #!/bin/bash
                  echo "Hello World" > index.html
                  nohup busybox httpd -f -p ${var.server_port} &
                  EOF  
    user_data_replace_on_change = true


    tags = {
      Name = "My boobs"
    }
  
}

resource "aws_security_group" "instance_sg" {
    name = "web"

    ingress {
        from_port = var.server_port
        to_port = var.server_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

  
}