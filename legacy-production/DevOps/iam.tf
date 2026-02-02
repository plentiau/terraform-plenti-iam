module "pipeline_automate_microservice_consumer_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.6.1"

  name              = "pipeline-automate-microservice-consumer-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["DevOps:*"]
  allow_send_message_topic_arns = [
    "arn:aws:sns:ap-southeast-2:${local.legacy_production_account_id}:*-EventBus-Production",
    "arn:aws:sns:ap-southeast-2:${local.plentiau_production_account_id}:*-EventBus-Production"
  ]
}

output "pipeline_automate_microservice_consumer_role_arn" {
  value = module.pipeline_automate_microservice_consumer_role.iam_role_arn
}

module "pipeline_regular_uat_monitor_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.6.1"

  name              = "pipeline-regular-uat-monitor-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["DevOps:*"]
  allow_get_ssm_parameter_arns = [
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/password_dbscripts_uat",
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/devops/*"
  ]
  allow_decrypt_key_arns = [
    "arn:aws:kms:ap-southeast-2:519527725796:key/e075267e-eebf-433f-88e5-c96a89c9de03"
  ]
}

output "pipeline_regular_uat_monitor_role_arn" {
  value = module.pipeline_regular_uat_monitor_role.iam_role_arn
}

module "pipeline_regular_prod_monitor_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.6.1"

  name              = "pipeline-regular-prod-monitor-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["DevOps:*"]
  allow_get_ssm_parameter_arns = [
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/password_production_monitor",
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/aurora_password_dbreadonly",
    "arn:aws:ssm:ap-southeast-2:519527725796:parameter/devops/*"
  ]
  allow_decrypt_key_arns = [
    "arn:aws:kms:ap-southeast-2:519527725796:key/e075267e-eebf-433f-88e5-c96a89c9de03"
  ]
  allow_read_s3_objects_arns = [
    "arn:aws:s3:::alert-configuration/*"
  ]
}

output "pipeline_regular_prod_monitor_role_arn" {
  value = module.pipeline_regular_prod_monitor_role.iam_role_arn
}
