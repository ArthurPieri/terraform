resource "aws_s3_bucket" "dev4" {
  bucket = "teste-dev4"
  acl    = "private"

  tags = {
    "Name"      = "teste-dev4"
    Environment = "dev"
  }
}
