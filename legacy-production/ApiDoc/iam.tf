module "pipeline_integration_guide_production_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.8.0"

  name              = "pipeline-integration-guide-production-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["ApiDoc:*"]
  allow_list_items_s3_bucket_arns = [
    "arn:aws:s3:::cdn.ratesetter.com.au"
  ]
  allow_read_s3_objects_arns = [
    "arn:aws:s3:::cdn.ratesetter.com.au/ui/integrationguide/*"
  ]
  allow_write_s3_objects_arns = [
    "arn:aws:s3:::cdn.ratesetter.com.au/ui/integrationguide/*"
  ]
  allow_delete_s3_objects_arns = [
    "arn:aws:s3:::cdn.ratesetter.com.au/ui/integrationguide/*"
  ]
}

output "pipeline_integration_guide_production_role_arn" {
  value = module.pipeline_integration_guide_production_role.iam_role_arn
}

module "pipeline_integration_guide_test_role" {
  source  = "app.terraform.io/plentiau/iam-role-wizard/aws"
  version = "2.8.0"

  name              = "pipeline-integration-guide-test-role"
  oidc_provider_arn = "arn:aws:iam::519527725796:oidc-provider/token.actions.githubusercontent.com"
  github_repo_names = ["ApiDoc:*"]
  allow_list_items_s3_bucket_arns = [
    "arn:aws:s3:::test.cdn.ratesetter.com.au"
  ]
  allow_read_s3_objects_arns = [
    "arn:aws:s3:::test.cdn.ratesetter.com.au/ui/integrationguide/*"
  ]
  allow_write_s3_objects_arns = [
    "arn:aws:s3:::test.cdn.ratesetter.com.au/ui/integrationguide/*"
  ]
  allow_delete_s3_objects_arns = [
    "arn:aws:s3:::test.cdn.ratesetter.com.au/ui/integrationguide/*"
  ]
}

output "pipeline_integration_guide_test_role_arn" {
  value = module.pipeline_integration_guide_test_role.iam_role_arn
}
