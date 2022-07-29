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

resource "aws_security_group" "allow_ssh_us_east_2" {
  provider    = aws.us-east-2
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
