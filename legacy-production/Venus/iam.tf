resource "aws_iam_role" "venus_build_termination_role" {
  name                 = "venus-build-termination-github-actions-role"
  max_session_duration = 3600

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${local.legacy_production_account_id}:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:plentiau/Venus:*"
          }
        }
      }
    ]
  })

  tags = {
    Name    = "venus-build-termination-github-actions-role"
    Purpose = "GitHub Actions - Venus build termination workflow"
  }
}

resource "aws_iam_role_policy" "venus_build_termination_ec2" {
  name = "venus-build-termination-ec2-policy"
  role = aws_iam_role.venus_build_termination_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DescribeEC2Instances"
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeTags"
        ]
        Resource = "*"
      },
      {
        Sid    = "TerminateVenusWebInstances"
        Effect = "Allow"
        Action = [
          "ec2:TerminateInstances"
        ]
        Resource = "arn:aws:ec2:ap-southeast-2:${local.legacy_production_account_id}:instance/*"
        Condition = {
          StringEquals = {
            "ec2:ResourceTag/Role" = "WebServer"
          }
        }
      },
      {
        Sid    = "DescribeTargetHealth"
        Effect = "Allow"
        Action = [
          "elasticloadbalancing:DescribeTargetHealth"
        ]
        Resource = "*"
      }
    ]
  })
}

output "venus_build_termination_role_arn" {
  value       = aws_iam_role.venus_build_termination_role.arn
  description = "ARN of the IAM role for the Venus build termination GitHub Actions workflow"
}
