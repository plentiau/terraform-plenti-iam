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
