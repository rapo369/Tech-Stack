#!/bin/bash
./create-topics.sh saas-topics.txt
kubectl apply -f saas-api.yaml
kubectl apply -f saas-krc-sp.yaml
kubectl apply -f saas-pulse-sp.yaml
kubectl apply -f saas-apigw.yaml

