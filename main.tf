terraform {
  # Configure the Terraform backend and provider
  required_providers {
    # GitHub provider configuration
    github = {
      source  = "hashicorp/github"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0"
}


# Configure the GitHub provider with the token from variables
provider "github" {
  token = var.github_token
}

# Define a GitHub repository resource for the Mini Project
resource "github_repository" "mp-data-ingestion" {
  name        = "mp-data-ingestion"
  description = "Mini Project: A repository for managing data ingestion processes."
  visibility  = "public"

  topics = ["terraform", "github", "example"]

  lifecycle {
    ignore_changes = [
      topics,
    ]
  }
}


resource "github_repository_file" "gitignore" {
  repository          = github_repository.mp-data-ingestion.name
  file                = ".gitignore"
  content             = <<EOF
# Terraform state files
*.tfstate
*.tfstate.*

# Terraform plan files
*.tfplan

# Crash log files
crash.log
crash.*.log

*.tfvars
*.tfvars.json

# Ignore override files
override.tf
override.tf.json
*_override.tf
*_override.tf.json


# Ignore CLI configuration files
.terraformrc
terraform.rc

# ignore venv
.venv

EOF
  commit_message      = "Add .gitignore file"
  overwrite_on_create = true
}