{{$cluster := or (env "CLUSTER") "develop"}}


{{$posts_api_nodes := service (printf "%s.interlife-posts-api" $cluster)}}
upstream posts_api_upstream { {{if ne (len $posts_api_nodes) 0}}{{range $posts_api_nodes}}
    server {{ .Address }}:{{ .Port }};{{ end }}
    {{else}}server 127.0.0.1;{{end}}
}

upstream s3_upstream { {{range service (printf "%s.s3" $cluster)}}
    server {{ .Address }}:{{ .Port }};{{ end }}
    keepalive 128;
}

server {
    listen       80 default_server;

    client_max_body_size 16M;

    location /posts-api {
        rewrite ^/posts-api(.*?)$ $1 break;

        fastcgi_pass posts_api_upstream;
        fastcgi_index index.php;
        include /etc/nginx/fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /var/www/html/public/index.php;
        fastcgi_param  REQUEST_URI $document_uri;
    }

    location /static {
        rewrite ^/static(.*?)$ /interlife break;

        proxy_pass http://s3_upstream;
        include /etc/nginx/proxy_params;
    }
}
