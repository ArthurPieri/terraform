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

resource "aws_instance" "dev4" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    "Name" = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  depends_on = [
    aws_s3_bucket.dev4
  ]
}

resource "aws_instance" "dev5" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    "Name" = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "teste-dev4"
  acl    = "private"

  tags = {
    "Name"      = "teste-dev4"
    Environment = "dev"
  }
}
