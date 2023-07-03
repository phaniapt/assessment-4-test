resource "aws_ecr_repository" "my_ecr_repository" {
  name = "my-ecr-repo-65"
  tags = {
    Environment = "testing"
  }
}