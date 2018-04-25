Taskhawk SQS App Terraform module
=================================

[Taskhawk](https://github.com/Automatic/taskhawk) is a replacement for celery that works on AWS SQS/SNS, while
keeping things pretty simple and straight forward. 

This module provides a custom [Terraform](https://www.terraform.io/) module for deploying Taskhawk 
infrastructure for Taskhawk SQS app.

Usage
-----
```hcl
module "taskhawk-dev-myapp" {
  source   = "Automatic/taskhawk-queue/aws"
  queue    = "DEV-MYAPP"
  iam      = true
  alerting = true

  enable_scheduler   = true
  aws_region         = "us-east-1"
  aws_account_id     = "12345678"

  tags = {
    app     = "myapp"
    env     = "dev"
  }
}
```

It's recommended that `queue` include your environment. 

Naming convention - uppercase alphanumeric and dashes only.

The SQS queue name will be prefixed by `TASKHAWK-`.

## Release Notes

[Github Releases](https://github.com/Automatic/terraform-aws-taskhawk-queue/releases)

## How to publish

Go to [Terraform Registry](https://registry.terraform.io/modules/Automatic/taskhawk-queue/aws), and Resync module.
