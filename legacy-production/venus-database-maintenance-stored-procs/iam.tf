module "pipeline_venus_database_maintenance_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.8.0"

  name              = "pipeline-venus-database-maintenance-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["venus-database-maintenance-stored-procs:*"]
  allow_pull_docker_images_from_ecr = [
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/microsoft/mssql-server-linux",
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/plenti-venus-dbup"
  ]
  allow_push_docker_image_to_ecr = [
    "arn:aws:ecr:ap-southeast-2:519527725796:repository/plenti-venus-dbup"
  ]
}

output "pipeline_venus_database_maintenance_role_arn" {
  value = module.pipeline_venus_database_maintenance_role.iam_role_arn
}

