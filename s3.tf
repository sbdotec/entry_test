resource "aws_s3_bucket" "terraform_state" {
  bucket = "kunikane-terraform-state"
  versioning {
    enabled = true
  }
}
