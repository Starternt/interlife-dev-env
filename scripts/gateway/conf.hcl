template {
  source = "/etc/nginx/conf.d/default.conf.tpl"
  destination = "/etc/nginx/conf.d/default.conf"
}

template {
  source = "/etc/nginx/conf.d/votes.conf.tpl"
  destination = "/etc/nginx/conf.d/votes.conf"
}

exec {
  command = "nginx -g \"daemon off;\""
}
