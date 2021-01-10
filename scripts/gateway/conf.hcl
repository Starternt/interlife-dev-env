template {
  source = "/etc/nginx/conf.d/default.conf.tpl"
  destination = "/etc/nginx/conf.d/default.conf"
}

exec {
  command = "nginx -g \"daemon off;\""
}
