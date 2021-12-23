terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.19.0"
    }

  }

}

provider "github" {
}


data "github_repository" "main" {
  full_name = "vnyakutya/terraform_prac"
}

resource "github_branch_protection" "main" {
  repository_id     = data.github_repository.main.node_id
  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true
}


output "debug-data" {
  value = data.github_repository.main
}

output "debug-branch-protection" {
  value = github_branch_protection.main
}