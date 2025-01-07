resource "aws_s3_bucket" "my_bucket" {
  # Properties are left blank initially
  bucket = "my-aws-bucket-import-example"

  tags = {
    Environment = "Production"
    Team        = "DevOps"
  }
}

# block_public_acls: Disallows the creation of public ACLs on the bucket.
# block_public_policy: Blocks any bucket policies that allow public access.
# ignore_public_acls: Ignores all public ACLs on the bucket and objects.
# restrict_public_buckets: Restricts the bucket from being made public, even with a bucket policy.

#Creates an S3 bucket with the public-read ACL, which grants read access to objects in the bucket.
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.my_bucket.id
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

#Bucket policy
#Policy allow for all users for all objects in the bucket
#Encodes the bucket policy as a JSON string for use in the Terraform configuration.

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}

#Security Risks: Public S3 buckets can expose sensitive data. 
#Ensure this setup is appropriate for your use case.