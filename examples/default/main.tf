resource "random_pet" "project" {
}

resource "tfe_organization" "org" {
  name  = "org-test-${random_pet.project.id}"
  email = "nobody@example.com"
}

resource "tfe_oauth_client" "github" {
  organization     = tfe_organization.org.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_pat
  service_provider = "github"
}

resource "tfe_workspace" "ws" {
  name         = random_pet.project.id
  organization = tfe_organization.org.name
  tag_names    = []
}

module "test_registry" {
  source = "../.."

  oauth_token_id = tfe_oauth_client.github.oauth_token_id

  modules = {
    organization = "jamesrcounts/terraform-tfe-organization"
    workspace    = "jamesrcounts/terraform-tfe-workspace"
  }
}