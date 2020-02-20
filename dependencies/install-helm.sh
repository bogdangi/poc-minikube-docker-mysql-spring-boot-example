#!/usr/bin/env bash
HELM_VERSION=v3.1.0

bash <(curl https://raw.githubusercontent.com/helm/helm/${HELM_VERSION}/scripts/get-helm-3) --version ${HELM_VERSION}

helm repo add stable https://kubernetes-charts.storage.googleapis.com
