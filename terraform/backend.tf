terraform {
  backend "s3" {
    bucket         = "algotest-sarfaraz-terraform-state"
    key            = "eks-auto-mode/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "algoTest-terraform-state-lock"
    encrypt        = true
  }
}
