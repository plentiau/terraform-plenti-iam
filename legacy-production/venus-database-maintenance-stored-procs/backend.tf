terraform {
  backend "s3" {
    bucket         = "plentiau-terraform-state"
    key            = "venus-database-maintenance-stored-procs/legacy-production/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "terraform-state-locking"
    assume_role = {
      role_arn = "arn:aws:iam::028287609508:role/cross-account/state-storage-plentiau-terraform-state"
    }
  }
}
