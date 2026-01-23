module "pipeline_production_monitor_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.8.0"

  name              = "pipeline-production-monitor-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["ProductionMonitor:*"]
  allow_get_ssm_parameter_arns = [
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/platform-monitor/*"
  ]
  allow_pull_docker_images_from_ecr = [
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/cypress/*",
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/node/*",
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/node-window/*",
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/slack-notifier"
  ]
}

output "pipeline_production_monitor_role_arn" {
  value = module.pipeline_production_monitor_role.iam_role_arn
}

module "pipeline_uat_monitor_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.8.0"

  name              = "pipeline-uat-monitor-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["ProductionMonitor:*"]
  allow_get_ssm_parameter_arns = [
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/uat-monitor/*"
  ]
  allow_pull_docker_images_from_ecr = [
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/cypress/*",
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/node/*",
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/node-window/*",
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/slack-notifier"
  ]
}

output "pipeline_uat_monitor_role_arn" {
  value = module.pipeline_uat_monitor_role.iam_role_arn
}
