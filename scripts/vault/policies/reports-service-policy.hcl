path "secret/saas/s3" {
    capabilities = ["read"]
}

path "secret/saas/databases/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/api-keys/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/mysql" {
    capabilities = ["read"]
}
