provider "aws" {
  region = "ap-southeast-2"
  default_tags {
    tags = {
      account_name = "plentiau-production"
      managed_by   = "terraform"
      repo         = "terraform-plenti-iam"
      path         = "plentiau-production/platform-ops-automation"
    }
  }
  assume_role {
    role_arn     = "arn:aws:iam::338608670045:role/ManagedByOrgRoot/CrossAccountInfraFullAdmin"
    session_name = "atlantis-terraform-plenti-iam-platform-ops-automation"
  }
  allowed_account_ids = ["338608670045"]
}
