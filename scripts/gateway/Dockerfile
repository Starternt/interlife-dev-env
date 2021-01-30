FROM nginx
MAINTAINER Konstantin <starternh@gmail.com>

RUN apt-get update && apt-get install curl -y \
    && curl -s https://releases.hashicorp.com/consul-template/0.25.1/consul-template_0.25.1_linux_amd64.tgz  > template.tgz \
    && tar -xvzf ./template.tgz \
    && mv ./consul-template /usr/local/bin/ \
    && rm ./template.tgz

COPY ./entry-point /usr/local/bin/entry-point
COPY ./conf.hcl /etc/consul-template/conf.hcl
COPY ./proxy_params /etc/nginx/proxy_params
COPY ./default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY ./votes.conf.tpl /etc/nginx/conf.d/votes.conf.tpl

ENV CONSUL_HTTP_ADDR=consul:8500
ENV CLUSTER=develop

ENTRYPOINT ["entry-point"]
CMD ["consul-template", "-config", "/etc/consul-template/conf.hcl"]
