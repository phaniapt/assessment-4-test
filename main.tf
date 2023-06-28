resource "aws_ecr_repository" "my_ecr_repository" {
  name = "my-testecr-assessment-4"
  tags = {
    Environment = "testing"
  }
}