resource "aws_ecr_repository" "my_ecr_repository" {
  name = "my-ecr-repo-40"
  tags = {
    Environment = "testing"
  }
}