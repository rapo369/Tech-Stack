#!/bin/bash
kubectl apply -f hivemq.yaml
sleep 10
tn=$(kubectl get pods|grep -w 'hivemq-.'|wc -l)
n=$(kubectl get pods|grep -w 'hivemq-.'|grep Running|wc -l)
while [ "$n" != "$tn" ]
do
echo "Waiting for pods to be ready"
sleep 5
n=$(kubectl get pods|grep -w 'hivemq-.'|grep Running|wc -l)
done
echo "HiveMQ pods are up"

