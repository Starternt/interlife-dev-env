path "secret/saas/dav-server/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/saas/billing-jwt" {
    capabilities = ["read"]
}

path "secret/saas/billing-database" {
    capabilities = ["read"]
}

path "secret/saas/prostor-sms" {
    capabilities = ["read"]
}

path "secret/saas/rabbitmq" {
    capabilities = ["read"]
}

path "secret/saas/payment-gateways/*" {
    capabilities = ["read"]
}
