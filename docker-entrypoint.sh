#!/bin/sh
set -e

PATHS=${PATHS:-/opt/app/logs/*/*.log}

DOCUMENT_TYPE=${DOCUMENT_TYPE:-log}

ETH=${ETH:-eth0}

SYSTEMIP=`ip addr show $ETH|grep inet.*brd|awk '{print $2}'|awk -F/ '{print $1}'`

# Render config file
cat filebeat.yml | sed "s|LOGSTASH_HOST|${LOGSTASH_HOST}|g" | sed "s|LOGSTASH_PORT|${LOGSTASH_PORT}|g" | sed "s|INDEX|${INDEX}|g" | sed "s|DOCUMENT_TYPE|${DOCUMENT_TYPE}|g" | sed "s|PATHS|${PATHS}|g" | sed "s|SYSTEMIP|${SYSTEMIP}|g" > filebeat.yml.tmp
cat filebeat.yml.tmp > filebeat.yml
rm filebeat.yml.tmp

exec "$@"
