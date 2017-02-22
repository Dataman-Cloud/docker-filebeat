docker run -d \
        -e LOGSTASH_HOST=10.157.21.2 \
        -e LOGSTASH_PORT=5043 \
	-e DOCUMENT_TYPE=tengine_access \
        -e PATHS="/docker/tengine/logs/*-access.log" \
	-v /data/filebeat:/usr/share/filebeat/bin/data \
	-v /data/opt/app/logs:/opt/app/logs \
        library/centos7-filebeat-5.0.2
