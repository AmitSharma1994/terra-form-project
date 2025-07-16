data "aws_s3_bucket" "existing_bucket" {
  bucket = "existing-app-bucket"
}

output "bucket_name" {
  value = data.aws_s3_bucket.existing_bucket.bucket
}