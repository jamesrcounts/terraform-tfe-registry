output "id" {
  value = tfe_organization.org.id
}

output "name" {
  value = tfe_organization.org.name
}

output "oauth_client_id" {
  value = tfe_oauth_client.github.id
}