{{$cluster := or (env "CLUSTER") "develop"}}
{{$votes_api_nodes := service (printf "%s.interlife-votes-api" $cluster)}}
upstream votes_api_upstream { {{if ne (len $votes_api_nodes) 0}}{{range $votes_api_nodes}}
    server {{ .Address }}:{{ .Port }};{{ end }}
    {{else}}server 127.0.0.1;{{end}}
}


server {
    listen       1090;

    client_max_body_size 16M;

    location /votes-api {
        rewrite ^/votes-api(.*?)$ $1 break;

        fastcgi_pass votes_api_upstream;
        fastcgi_index index.php;
        include /etc/nginx/fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /var/www/html/public/index.php;
        fastcgi_param  REQUEST_URI $document_uri;
    }
}
