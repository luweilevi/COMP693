
module "postgres_dev" {
    source = "../../modules/database"
    name                          = "demo-postgresdb-dev"
    resource_group_name           = module.resource_group.name
    location                      = module.resource_group.location
    postgresql_version            = "15"
    sku_name                      = "B_Standard_B1ms"
    administrator_login           = "postgres"
    administrator_password        = data.azurerm_key_vault_secret.postgres_password.value
    zone                          = null
    public_network_access_enabled = true
    delegated_subnet_id           = null
    private_dns_zone_id           = null
    backup_retention_days         = 7
    geo_redundant_backup_enabled  = false
    
    firewall_rules = {
        allow_ips = {
            start_ip_address = "0.0.0.0"
            end_ip_address   = "255.255.255.255"
        }
    }   

    databases = {
        demo_db = {
            character_set = "UTF8"
        }
    }
}