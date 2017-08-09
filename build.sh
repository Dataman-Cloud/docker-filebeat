#!/bin/bash
BASE_DIR=$(cd `dirname $0` && pwd)
cd $BASE_DIR
docker rmi -f demoregistry.dataman-inc.com/library/centos7-filebeat
docker build --no-cache -t demoregistry.dataman-inc.com/library/centos7-filebeat .
docker push demoregistry.dataman-inc.com/library/centos7-filebeat
