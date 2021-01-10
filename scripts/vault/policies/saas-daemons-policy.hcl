path "secret/saas/databases/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/saas/api-keys/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/saas/sync-api-keys/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/saas/mysql" {
    capabilities = ["read"]
}

path "secret/saas/rabbitmq" {
    capabilities = ["read"]
}

path "secret/saas/prostor-sms" {
    capabilities = ["read"]
}

path "secret/saas/billing-database" {
    capabilities = ["read"]
}

path "secret/saas/loyalty-database" {
    capabilities = ["read"]
}

path "secret/catalog/database" {
    capabilities = ["read"]
}
