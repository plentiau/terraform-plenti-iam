module "pipeline_broker_portal_user_creation_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.8.0"

  name              = "pipeline-broker-portal-user-creation-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["ProcessAutomations:*"]
  allow_get_ssm_parameter_arns = [
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/password_AuthenticationAdmin"
  ]
  allow_decrypt_key_arns = [
    "arn:aws:kms:ap-southeast-2:519527725796:key/e075267e-eebf-433f-88e5-c96a89c9de03"
  ]
}

output "pipeline_broker_portal_user_creation_role_arn" {
  value = module.pipeline_broker_portal_user_creation_role.iam_role_arn
}

