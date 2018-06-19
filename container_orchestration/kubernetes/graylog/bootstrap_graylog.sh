#!/bin/bash

#wget https://raw.githubusercontent.com/Graylog2/graylog2-images/2.1/docker/config/graylog.conf -O graylog.conf
#wget https://raw.githubusercontent.com/Graylog2/graylog2-images/2.1/docker/config/log4j2.xml -O log4j2.xml

kubectl create secret generic graylogpasswordsha2 --from-literal=GRAYLOG_ROOT_PASSWORD_SHA2=aedd74d281b21d855992e46d95b14e02940db54d566fd6811b82128327d0cc1f
kubectl create secret generic graylogpasswordsecret --from-literal=GRAYLOG_PASSWORD_SECRET=alibabsaidopensesameandcaveopened

#kubectl apply -f graylog_mongo_service.yml
#kubectl apply -f graylog_es_service.yml
#kubectl apply -f graylog_svc.yml
#kubectl apply -f graylog.yml


