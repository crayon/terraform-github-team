terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = ">=4.13.0"
    }
  }
}

resource "github_team" "team" {
  name        = var.name
  description = var.description
  privacy     = var.privacy
}

resource "github_team_membership" "members" {
  for_each = toset(var.members)
  team_id  = github_team.team.id
  username = each.key
  role     = "member"
}

resource "github_team_membership" "maintainers" {
  for_each = toset(var.maintainers)
  team_id  = github_team.team.id
  username = each.key
  role     = "maintainer"
}