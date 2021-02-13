# interlife Development Environment




## Requirements
* Docker 17.06.0+
* Docker Compose 1.22.0+

## Deploying
To deploy environment you need:
* Run a file ```install.sh```
* Wait until initialization containers will finish work:
```
docker-compose ps
```

* Execute following commands
```

```

## Launching
For launching environment you need to run a command:
```
docker-compose up -d
```

## Stopping
To stop environment you need to run a command
```
docker-compose stop
```

## Environment components
* [MySQL 8.0](https://www.mysql.com/) - ```localhost:3306``` (username: ```root```, password: ```root```)
* [Consul](https://www.consul.io/) - ```http://localhost:8500```
* [Vault](https://www.vaultproject.io/) - ```http://localhost:8200``` (look for a token in a file ```./scripts/vault/private_keys```) 
(token for access in a file ```scripts/vault/private_keys```)
* [Minio](https://www.minio.io/) - ```http://localhost:9000``` (access key - ```minio```, secret key - ```minio```)
* [RabbitMQ](https://www.rabbitmq.com/) - ```http://localhost:15672``` (username: ```user```, password: ```password```)
* [Graylog](https://www.graylog.org/) - ```http://localhost:9090``` (username: ```admin```, password: ```admin```)
* [Kafka](https://kafka.apache.org/) - ```http://localhost:9092```
* [Elasticsearch](https://www.elastic.co/)