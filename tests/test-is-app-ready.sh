#!/usr/bin/env bash

serviceName=docker-mysql-spring-boot-example
echo "===================="
echo Wait for $serviceName
kubectl wait \
        --for=condition=available \
        --timeout=30s \
        deployment/$serviceName

echo "===================="
echo Verify $serviceName
curl "$(minikube service $serviceName --url)/all/"
echo
