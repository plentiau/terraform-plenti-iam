provider "aws" {
  region = "ap-southeast-2"
  default_tags {
    tags = {
      account_name = "legacy-production"
      managed_by   = "terraform"
      repo         = "terraform-plenti-iam"
      path         = "legacy-production/platform-ops-automation"
    }
  }
  assume_role {
    role_arn     = "arn:aws:iam::519527725796:role/ManagedByOrgRoot/CrossAccountInfraFullAdmin"
    session_name = "atlantis-terraform-plenti-iam-platform-ops-automation"
  }
  allowed_account_ids = ["519527725796"]
}
