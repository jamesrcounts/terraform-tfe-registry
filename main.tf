resource "tfe_registry_module" "module" {
  vcs_repo {
    display_identifier = "my-org-name/terraform-provider-name"
    identifier         = "my-org-name/terraform-provider-name"
    oauth_token_id     = var.oauth_token_id
  }
}