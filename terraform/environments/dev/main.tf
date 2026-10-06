module "resource_group" {
  source = "../../modules/resource_group"

  name     = local.resource_group_name
  location = local.rg_location
  tags     = local.tags
}

module "vnet_dns" {
  source = "../../modules/vnet"

  name_prefix         = "demo"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  vnet_address_space = ["10.10.0.0/16"]

  subnets = {
    app = {
      address_prefixes = ["10.10.1.0/24"]
    }
    data = {
      address_prefixes = ["10.10.2.0/24"]
    }
  }

  # private_dns_zone_name = "privatelink.blob.core.windows.net"   # or your custom domain
  registration_enabled = false

  tags = local.tags
}

