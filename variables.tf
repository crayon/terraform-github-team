variable "name" {
  type = string
  description = "Name of the team."
}

variable "description" {
  type = string
  description = "Description used for the team."
  default = null
}

variable "privacy" {
  type = string
  description = "Privacy setting for the team."
  default = "secret"
}

variable "members" {
  type = list(string)
  description = "Members of the team."
  default = []
}

variable "maintainers" {
  type = list(string)
  description = "Maintainers of the team."
  default = []
}