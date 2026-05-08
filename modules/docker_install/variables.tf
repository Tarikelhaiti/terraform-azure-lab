variable "ssh_private_key" {
  type        = string
  description = "Clé privée SSH"
}
variable "user_name" {
  description = "Nom d'utilisateur pour la machine virtuelle"
  type        = string
}

variable "host" {
  type = string
}
