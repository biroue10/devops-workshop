provider "aws"{
    region="us-east-1"
}
resource "aws_instance" "demo_server"{
    ami = "ami-02c21308fed24a8ab"
    instance_type = "t2.micro"
    key_name = "terraform"
}
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH access"

  ingress {
    description = "ssh inbound rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [0.0.0.0/0]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-protocol"
  }
}