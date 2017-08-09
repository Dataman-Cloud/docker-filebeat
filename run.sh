#!/bin/bash
docker run -d --name dataman-filebeat \
               --log-driver=json-file \
               --label BEAT_EXCLUDE=true \
               -v /data/docker:/data/docker \
               -v /data/config/filebeat:/data/config/filebeat \
               -v /data/log/filebeat:/data/log/filebeat \
               demoregistry.dataman-inc.com/library/centos7-filebeat \
               -c /data/config/filebeat/filebeat.yml
