#!/bin/bash

echo "Assigning node labels"
if [ ! -f hosts.ini ]
then
  echo "ERROR: hosts.ini not found. Cannot assign node labels. Exiting"
  exit -1
fi
for k in $(grep 'kafka.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=kafka; done
for k in $(grep 'zk.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=zk; done
for k in $(grep 'mqtt.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=mqtt; done
for k in $(grep 'redis.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=redis; done
for k in $(grep 'sentinel.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=sentinel; done
for k in $(grep 'streaming.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=streaming; done
for k in $(grep 'mongo-config.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=mongo-config; done
for k in $(grep 'mongo-shard.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=mongo-shard; done
for k in $(grep 'mongo.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true storage.ignite.harman.com/prepstatus=unmounted; done
for k in $(grep 'api.*ansible' hosts.ini|awk -F= '{print $2}'|sed 's/\./-/g'|sed 's/^/ip-/'|sed 's/$/.ec2.internal/'); do kubectl label nodes $k --overwrite=true node.ignite.harman.com/component=api; done

echo "Assigned node labels"
kubectl get nodes --show-labels
echo "Type y to continue..." && read pro && if [ "$pro" != "y" ]; then exit 1; fi

echo "Setting up private docker registry access"
kubectl create secret docker-registry regcred --docker-server=registry.ahanet.net:5000 --docker-username=ssasidharan --docker-password=ssDocker@2016 --docker-email=sabarish.sasiharan@harman.com

printf "\n===Setting up storage"
kubectl apply -f storage.yaml
echo "Type y to continue..." && read pro && if [ "$pro" != "y" ]; then exit 1; fi
printf "\n===Setting up zk"
kubectl apply -f zk.yaml
echo "Type y to continue..." && read pro && if [ "$pro" != "y" ]; then exit 1; fi
printf "\n===Setting up kafka"
kubectl apply -f kafka.yaml	
echo "Type y to continue..." && read pro && if [ "$pro" != "y" ]; then exit 1; fi
printf "\n===Setting up redis"
./redis-bootstrap.sh
echo "Type y to continue..." && read pro && if [ "$pro" != "y" ]; then exit 1; fi
printf "\n===Setting up mongo"
./mongo-bootstrap.sh 2
echo "Type y to continue..." && read pro && if [ "$pro" != "y" ]; then exit 1; fi
printf "\n===Setting up hivemq"
kubectl apply -f hivemq.yaml
echo "Type y to continue..." && read pro && if [ "$pro" != "y" ]; then exit 1; fi
printf "\n===Setting up saas-app"
./saas-bootstrap.sh
