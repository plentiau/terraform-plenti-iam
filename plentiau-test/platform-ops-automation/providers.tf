provider "aws" {
  region = "ap-southeast-2"
  default_tags {
    tags = {
      account_name = "plentiau-test"
      managed_by   = "terraform"
      repo         = "terraform-plenti-iam"
      path         = "plentiau-test/platform-ops-automation"
    }
  }
  assume_role {
    role_arn     = "arn:aws:iam::939087296411:role/ManagedByOrgRoot/CrossAccountInfraFullAdmin"
    session_name = "atlantis-terraform-plenti-iam-platform-ops-automation"
  }
  allowed_account_ids = ["939087296411"]
}
