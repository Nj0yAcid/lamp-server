terraform {
  backend "s3" {
    bucket         = "week10-v"
    key            = "lamp-server-1/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "state-log"
  }
}