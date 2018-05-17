#!/bin/bash
echo "Creating redis nodes"
kubectl apply -f redis-cluster.yaml
n=$(kubectl get pods|grep redis-cluster|grep Running|wc -l)
while [ "$n" != "6" ]
do
echo "Waiting for nodes to be ready"
sleep 5
n=$(kubectl get pods|grep redis-cluster|grep Running|wc -l)
done
if [ "$n" -eq "6" ]
then
echo "Clustering..."
kubectl exec -it redis-cluster-1 -- bash -c "apt-get -y update"
kubectl exec -it redis-cluster-1 -- bash -c "apt-get -y --no-install-recommends install ruby wget"
kubectl exec -it redis-cluster-1 -- bash -c "gem install redis -v 3.3.5"
kubectl exec -it redis-cluster-1 -- bash -c "wget -O /tmp/redis-trib http://download.redis.io/redis-stable/src/redis-trib.rb && chmod 755 /tmp/redis-trib"
kubectl exec -it redis-cluster-1 -- bash -c "/tmp/redis-trib create --replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')"
echo "Clustering is complete. Cluster is ready"
fi
