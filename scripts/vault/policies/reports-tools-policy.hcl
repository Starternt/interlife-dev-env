path "secret/saas/s3" {
    capabilities = ["read"]
}

path "secret/saas/databases/*" {
    capabilities = ["read", "list"]
}