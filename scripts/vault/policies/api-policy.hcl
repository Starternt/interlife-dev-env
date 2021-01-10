path "secret/saas/jwt" {
    capabilities = ["read"]
}

path "secret/saas/s3" {
    capabilities = ["read"]
}

path "secret/saas/rabbitmq" {
    capabilities = ["read"]
}

path "secret/saas/databases/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/api-keys/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/dav-server/*" {
    capabilities = ["read", "list"]
}
