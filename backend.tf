terraform {

  backend "s3" {

    bucket         = "aws-ecr-task-bucket-765"

    key            = "ecr/tf-state"

    region         = "ap-south-1"

    #dynamodb_table = "terraform_state_lock_sydhi_uat"

  }
}

