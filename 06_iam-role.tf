# Define IAM Role for EC2 to assume
resource "aws_iam_role" "iam-role" {
  name               = var.iam_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Define IAM Policy for ECR access
resource "aws_iam_policy" "ecr_access_policy" {
  name        = "ECRAccessPolicy"
  description = "Policy to allow EC2 to access ECR"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetRepositoryPolicy",
        "ecr:ListImages",
        "ecr:BatchGetImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:PutImage"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach the ECR access policy to the IAM role
resource "aws_iam_role_policy_attachment" "ecr_policy_attachment" {
  policy_arn = aws_iam_policy.ecr_access_policy.arn
  role       = aws_iam_role.iam-role.name
}

# Define IAM Policy for DynamoDB access (for Terraform state locking)
resource "aws_iam_policy" "terraform_dynamodb_access_policy" {
  name        = "TerraformDynamoDBAccessPolicy"
  description = "Policy to allow Terraform to access DynamoDB for state locking"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:PutItem",
        "dynamodb:GetItem",
        "dynamodb:DescribeTable",
        "dynamodb:Scan",
        "dynamodb:Query"
      ],
      "Resource": "arn:aws:dynamodb:us-east-1:your-account-id:table/lock-files"
    }
  ]
}
EOF
}

# Attach the DynamoDB access policy to the IAM role
resource "aws_iam_role_policy_attachment" "terraform_dynamodb_access_policy_attachment" {
  policy_arn = aws_iam_policy.terraform_dynamodb_access_policy.arn
  role       = aws_iam_role.iam-role.name
}