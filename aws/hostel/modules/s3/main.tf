resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
    Env  = "Dev"
  }
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "s3_web" {
  bucket = aws_s3_bucket.s3.id

  index_document {
    suffix = "index.html"
  }
  # TODO: Improve this to make it general to any built app, not just the react one
  error_document {
    key = "koala-hostel/index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "pb" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.s3.id
  policy = data.aws_iam_policy_document.allow_public_access.json
}

data "aws_iam_policy_document" "allow_public_access" {
  statement {
    sid = "Allow Public Read Access"
    principals {
      identifiers = ["AWS"]
      type        = "*"
    }
    effect = "Allow"
    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.s3.arn,
      "${aws_s3_bucket.s3.arn}/*",
    ]

  }
}
