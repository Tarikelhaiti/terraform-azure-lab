variable "ssh_public_key" {
  type        = string
  description = "Clé publique SSH"
}

variable "ssh_private_key" {
  type        = string
  description = "Clé privée SSH"
}

variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources"
}

variable "location" {
  type        = string
  description = "Localisation de la ressource"
}

variable "vnet_name" {
  type        = string
  description = "Nom du réseau virtuel"
}

variable "subnet_name" {
  type        = string
  description = "Nom du sous-réseau"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Adresse IP du VNet"
}

variable "private_ip_address" {
  type        = string
  description = "Adresse IP privée"
}


variable "subnet_address_space" {
  type        = list(string)
  description = "Adresse IP du sous-réseau"
}

variable "public_ip_name" {
  type        = string
  description = "Nom de la Public IP"
}

variable "allocation_method" {
  type        = string
  description = "Méthode d'allocation (Static ou Dynamic)"
}
variable "nic_name" {
  description = "Nom de la carte réseau"
  type        = string
}

variable "ip_config_name" {
  description = "Nom de la configuration IP"
  type        = string
}

variable "private_ip_allocation" {
  description = "Mode d'allocation de l'IP privée"
  type        = string
}

variable "nsg_name" {
  description = "Nom du groupe de sécurité"
  type        = string
}

variable "vm_name" {
  description = "Nom de la machine virtuelle"
  type        = string
}

variable "user_name" {
  description = "Nom d'utilisateur pour la machine virtuelle"
  type        = string
}

variable "vm_size" {
  description = "Taille de la machine virtuelle"
  type        = string
}
