{{$cluster := or (env "CLUSTER") "develop"}}
{{$users_api_nodes := service (printf "%s.interlife-users-api" $cluster)}}
upstream users_api_upstream { {{if ne (len $users_api_nodes) 0}}{{range $users_api_nodes}}
    server {{ .Address }}:{{ .Port }};{{ end }}
    {{else}}server 127.0.0.1;{{end}}
}


server {
    listen       1060;

    client_max_body_size 16M;

    location /users-api {
        rewrite ^/users-api(.*?)$ $1 break;

        fastcgi_pass users_api_upstream;
        fastcgi_index index.php;
        include /etc/nginx/fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /var/www/html/public/index.php;
        fastcgi_param  REQUEST_URI $document_uri;
    }
}
