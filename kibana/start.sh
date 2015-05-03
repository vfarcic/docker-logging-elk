#!/usr/bin/env bash

export ADDR=${DB_PORT_9200_TCP_ADDR:-elasticsearch}
export PORT=${DB_PORT_9200_TCP_PORT:-9200}

sed -i "s/^elasticsearch_url: .*$/elasticsearch_url: \"http:\/\/${ADDR}:${PORT}\"/g" /kibana/config/kibana.yml

/kibana/bin/kibana
