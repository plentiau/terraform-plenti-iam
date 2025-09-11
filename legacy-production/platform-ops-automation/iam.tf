module "pipeline_tls_automation_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.3.0"

  name               = "pipeline-tls-automation-role"
  oidc_provider_arn  = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names  = ["platform-ops-automation:*"]
  allow_list_secrets = true
  allow_get_secret_value = [
    "arn:aws:secretsmanager:ap-southeast-2:519527725796:secret:/test/services/*",
    "arn:aws:secretsmanager:ap-southeast-2:519527725796:secret:/production/services/*"
  ]

}

output "pipeline_tls_automation_role_arn" {
  value = module.pipeline_tls_automation_role.iam_role_arn
}
