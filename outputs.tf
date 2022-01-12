output "debug-data" {
  value = data.github_repository.test
}

output "debug-branch-protection" {
  value = github_branch_protection.main
}
