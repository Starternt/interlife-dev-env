path "secret/saas/rabbitmq" {
    capabilities = ["read"]
}

path "secret/saas/databases/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/api-keys/*" {
    capabilities = ["read", "list"]
}

path "secret/saas/billing-database" {
    capabilities = ["read"]
}

path "secret/saas/prostor-sms" {
    capabilities = ["read"]
}

path "secret/saas/twilio-sms" {
    capabilities = ["read"]
}
