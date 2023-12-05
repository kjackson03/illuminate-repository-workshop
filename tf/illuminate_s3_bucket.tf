resource "aws_s3_bucket" "illuminate_bucket" {
  bucket        = "illuminate-workshop-bucket-chicago-12072023"

  tags = {
    Replace_this_tag = "Palo Alto Networks - Prisma Cloud"
    Environment = "Illuminate Chicago Workshop 12072023"
  }

  force_destroy = true
}

resource "aws_s3_bucket_versioning" "s3_versioning_for_illuminate_bucket" {
  bucket = aws_s3_bucket.illuminate_bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_public_access_block" "illuminate_bucket_access_policy" {
  bucket = aws_s3_bucket.illuminate_bucket.id
  block_public_acls   = false
  block_public_policy = false
  restrict_public_buckets = false
  ignore_public_acls = false
}
