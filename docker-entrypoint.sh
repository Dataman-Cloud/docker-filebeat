#!/bin/sh
set -e

PATHS=${PATHS:-/opt/app/logs/*/*.log}

DOCUMENT_TYPE=${DOCUMENT_TYPE:-log}

# Render config file
cat filebeat.yml | sed "s|LOGSTASH_HOST|${LOGSTASH_HOST}|g" | sed "s|LOGSTASH_PORT|${LOGSTASH_PORT}|g" | sed "s|INDEX|${INDEX}|g" | sed "s|DOCUMENT_TYPE|${DOCUMENT_TYPE}|g" | sed "s|PATHS|${PATHS}|g" > filebeat.yml.tmp
cat filebeat.yml.tmp > filebeat.yml
rm filebeat.yml.tmp

exec "$@"
