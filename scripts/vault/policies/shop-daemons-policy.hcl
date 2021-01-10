path "secret/saas/api-keys/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/rabbitmq" {
    capabilities = ["read"]
}

path "secret/saas/prostor-sms" {
    capabilities = ["read"]
}
