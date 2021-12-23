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


data "github_repository" "test" {
  full_name = "vnyakutya/terraform_prac"
}

resource "github_branch_protection" "main" {
  repository_id    = data.github_repository.test.node_id
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

data "github_user" "current" {
  username = ""
}

output "current_github_login" {
  value = "${data.github_user.current.login}"
}

required_pull_request_reviews {
    dismiss_stale_reviews  = true
    restrict_dismissals    = true
    dismissal_restrictions = data.github_user.current.node_id
  }
