template {
  source = "/etc/nginx/conf.d/default.conf.tpl"
  destination = "/etc/nginx/conf.d/default.conf"
}

template {
  source = "/etc/nginx/conf.d/votes.conf.tpl"
  destination = "/etc/nginx/conf.d/votes.conf"
}

template {
  source = "/etc/nginx/conf.d/users.conf.tpl"
  destination = "/etc/nginx/conf.d/users.conf"
}

exec {
  command = "nginx -g \"daemon off;\""
}
