variable "username" {
  description = "github owner"
  type        = string
  sensitive   = true
}

variable "token" {
  description = "personal access token"
  type        = string
  sensitive   = true
}
