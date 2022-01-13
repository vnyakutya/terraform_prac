terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.19.0"
    }

  }

}

provider "github" {
  token = var.token 
  owner = "vnyakutya"
}

data "github_repository" "test" {
  full_name = "vnyakutya/terraform_prac"
}

resource "github_branch_protection" "main" {
  repository_id   		  = data.github_repository.test.node_id
  pattern         		  = "main"
  enforce_admins   		  = true
  allows_deletions 		  = true
  require_conversation_resolution = false
  require_signed_commits          = false
  
  required_status_checks {
    strict   = true
  }
/*
  required_pull_request_reviews {
    dismiss_stale_reviews 	    = true
    restrict_dismissals    	    = false
    required_approving_review_count = 1
  } */
}
