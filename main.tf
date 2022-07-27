provider "aws" {
  #version = "~> 2.1"
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    "Name" = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"

  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "allow ssh"
    from_port        = 22
    prefix_list_ids  = []
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "tcp"
    to_port          = 22
    self             = true
    security_groups  = ["sg-07be4fdef15342fad"]
  }]

  tags = {
    "Name" = "allow-ssh"
  }
}
