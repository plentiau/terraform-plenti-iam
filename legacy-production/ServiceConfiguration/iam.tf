module "pipeline_service_configuration_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.8.0"

  name              = "pipeline-service-configuration-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["ServiceConfiguration:*"]
  allow_get_ssm_parameter_arns = [
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/deployment/*"
  ]
}

output "pipeline_service_configuration_role_arn" {
  value = module.pipeline_service_configuration_role.iam_role_arn
}

