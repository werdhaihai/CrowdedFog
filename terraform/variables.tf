variable "clients" {
    description = "Map of client configuration"
    type = map(object({
        resource_group_name  : string
        storage_account_name : string
    }))
    default = {
        "client1" = {
            resource_group_name  = "rg-client1"
            storage_account_name = "storageaccclient1"
        },
        "client2" = {
            resource_group_name  = "rg-client2"
            storage_account_name = "storageaccclient2"
        }
    }
}
