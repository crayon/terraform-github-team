terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.19.0"
    }
  }
}

resource "github_team" "team" {
  name           = var.name
  description    = var.description
  privacy        = var.privacy
  parent_team_id = var.parent_team
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

resource "github_team_repository" "repos" {
  for_each = { for r in var.repositories : r.name => r }

  team_id    = github_team.team.id
  repository = each.key
  permission = each.value.permission
}
