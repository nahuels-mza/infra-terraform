resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name
  #   acl    = "private"

  tags = {
    Name = "hostel-bucket"
    Env  = "Dev"
  }
}

# resource "aws_s3_bucket_policy" "allow_access_from_outside" {
#   bucket = aws_s3_bucket.app_bucket.id
#   policy = data.aws_iam_policy_document.allow_access_from_outside.json
# }

# data "aws_iam_policy_document" "allow_access_from_outside" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = [""]
#     }
#     actions = [
#       "s3:GetObject",

#     ]

#     sid    = "PublicReadForGetBucketObjects"
#     effect = "Allow"
#     resources = [
#       aws_s3_bucket.app_bucket.arn,
#       "${aws_s3_bucket.app_bucket.arn}/*",
#     ]
#   }
# }
