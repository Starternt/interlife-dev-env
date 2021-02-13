#!/usr/bin/env bash

echo "Clone posts API repository"
git clone -b master git@github.com:Starternt/posts-api.git

echo "Clone votes API repository"
git clone -b master git@github.com:Starternt/votes-api.git

echo "Clone users API repository"
git clone -b master git@github.com:Starternt/users-api.git

echo "Clone notifications service repository"
git clone -b master git@github.com:Starternt/notifications-service.git

sleep 2; curl -u "admin:admin" -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'X-Requested-By: curl' -d @"etc/graylog/input-gelf-udp.json" "http://127.0.0.1:9090/api/system/inputs?pretty=true"
