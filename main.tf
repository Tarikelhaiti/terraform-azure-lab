module "create_vm" {
  source                = "./modules/vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  subnet_name           = var.subnet_name
  subnet_address_space  = var.subnet_address_space
  public_ip_name        = var.public_ip_name
  private_ip_address    = var.private_ip_address
  private_ip_allocation = var.private_ip_allocation
  allocation_method     = var.allocation_method
  nsg_name              = var.nsg_name
  nic_name              = var.nic_name
  ip_config_name        = var.ip_config_name
  vm_name               = var.vm_name
  vm_size               = var.vm_size
  user_name             = var.user_name
  ssh_public_key        = var.ssh_public_key
  ssh_private_key       = var.ssh_private_key
}

module "install_docker" {
  source          = "./modules/docker_install"
  ssh_private_key = var.ssh_private_key
  user_name       = var.user_name
  host            = module.create_vm.public_ip
  depends_on      = [module.create_vm]
}

module "create_docker_nginx" {
  source     = "./modules/docker_nginx"
  depends_on = [module.install_docker]
}
