resource "tfe_registry_module" "module" {
  for_each = var.modules

  vcs_repo {
    display_identifier = each.value
    identifier         = each.value
    oauth_token_id     = var.oauth_token_id
  }
}