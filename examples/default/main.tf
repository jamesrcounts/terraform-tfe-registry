resource "random_pet" "project" {
}

module "test_org" {
  source = "../../"

  name       = "org-test-${random_pet.project.id}"
  email      = "somebody@example.com"
  github_pat = var.github_pat
}

data "tfe_organization" "test_org" {
  depends_on = [module.test_org]

  name = module.test_org.name
}

data "tfe_oauth_client" "client" {
  oauth_client_id = module.test_org.oauth_client_id
}

output "name" {
  value = data.tfe_organization.test_org.name
}

output "email" {
  value = data.tfe_organization.test_org.email
}

output "oauth_http_url" {
  value = data.tfe_oauth_client.client.http_url
}