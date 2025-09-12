module "pipeline_tls_automation_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.3.0"

  name                           = "pipeline-tls-automation-role"
  oidc_provider_arn              = "arn:aws:iam::939087296411:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names              = ["platform-ops-automation:*"]
  allow_list_all_zones           = true
  allow_read_zone_arns           = ["arn:aws:route53:::hostedzone/Z0729871RY2BG34RISU7"]
  allow_change_records_zone_arns = ["arn:aws:route53:::hostedzone/Z0729871RY2BG34RISU7"]
}

output "pipeline_tls_automation_role_arn" {
  value = module.pipeline_tls_automation_role.iam_role_arn
}
