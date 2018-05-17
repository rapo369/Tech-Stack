#!/bin/bash

echo "Creating redis pods"
kubectl apply -f redis.yaml
n=$(kubectl get pods|grep -w 'redis-.'|grep Running|wc -l)
while [ "$n" != "1" ]
do
echo "Waiting for pod to be ready"
sleep 5
n=$(kubectl get pods|grep -w 'redis-.'|grep Running|wc -l)
done
echo "First redis pod is up"

echo "Creating sentinel pods"
kubectl apply -f redis-sentinel.yaml
n=$(kubectl get pods|grep -w 'redis-sentinel-.'|grep Running|wc -l)
while [ "$n" != "3" ]
do
echo "Waiting for pods to be ready"
sleep 5
n=$(kubectl get pods|grep -w 'redis-sentinel-.'|grep Running|wc -l)
done
echo "Sentinel pods are up"
echo "Adding more redis pods"

kubectl scale sts/redis --replicas 3
n=$(kubectl get pods|grep -w 'redis-.'|grep Running|wc -l)
while [ "$n" != "3" ]
do
echo "Waiting for pod to be ready"
sleep 5
n=$(kubectl get pods|grep -w 'redis-.'|grep Running|wc -l)
done
echo "Slave pods are up"
