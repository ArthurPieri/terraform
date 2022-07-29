resource "aws_instance" "dev" {
  count         = 3
  ami           = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    "Name" = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami           = var.amis["us-east-1"]
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
  ami           = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    "Name" = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}

resource "aws_instance" "dev6" {
  provider      = aws.us-east-2
  ami           = var.amis["us-east-2"]
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    "Name" = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_us_east_2.id}"]
  depends_on             = [aws_dynamodb_table.dynamodb-homolog]
}
