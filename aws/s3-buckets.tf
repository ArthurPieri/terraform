resource "aws_s3_bucket_acl" "dev4" {
  bucket = "teste-dev4"
  acl    = "private"
}
