resource "aws_cognito_user_pool" "aws_cognito_pool" {
  name = "hackaton-${var.project}-user-pool"

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-user-pool"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}

resource "aws_shield_protection" "this" {
  name     = "hackaton-${var.project}-shield"
  resource_arn = var.resource_arn
}

resource "aws_iam_role" "generic_service_role" {
  name = "hackaton-${var.project}-generic-role"

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = merge(
    var.tags,
    {
      Name = "hackaton-${var.project}-generic-role"
    }
  )
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com", "lambda.amazonaws.com"]
    }
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "hackaton-${var.name}-jenkins-sg"
  description = "Security Group para Jenkins EC2 server."
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH from Axel IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["177.248.19.209/32"]
  }

  ingress {
    description = "Allow Jenkins Web UI from Axel IP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["177.248.19.209/32"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-jenkins-sg"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}