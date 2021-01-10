path "secret/saas/api-keys/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/sync-api-keys/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/loyalty-database" {
    capabilities = ["read"]
}
