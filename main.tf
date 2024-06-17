terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }
    archive = {
      source = "hashicorp/archive"
      version = "~> 2.0"
    }
    external = {
      source = "hashicorp/external"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

provider "null" {}

provider "archive" {}

provider "external" {}

# Variables
variable "github_repo_url" {
  description = "The URL of the GitHub repository"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

# Clone GitHub repository
resource "null_resource" "clone_repo" {
  provisioner "local-exec" {
    command = "git clone ${var.github_repo_url} ${var.project_name}"
  }
}

# Install dependencies
resource "null_resource" "install_dependencies" {
  depends_on = [null_resource.clone_repo]

  provisioner "local-exec" {
    command = "./scripts/install_dependencies.sh ${var.project_name}"
  }
}

# Deploy to Docker
resource "null_resource" "deploy_to_docker" {
  depends_on = [null_resource.build_project]

  provisioner "local-exec" {
    command = "./scripts/deploy_to_docker.sh ${var.project_name}"
  }
}
