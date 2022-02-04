variable "modules" {
  default     = {}
  description = "(Optional) A map of friendly names to module identifiers for modules to add to the registry."
  type        = map(string)
}

variable "oauth_token_id" {
  description = "(Required) The organization name."
  type        = string
}