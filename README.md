![Test application on minikube](https://github.com/bogdangi/poc-minikube-docker-mysql-spring-boot-example/workflows/Test%20application%20on%20minikube/badge.svg)

# Introduction

1. This repository deploys two pods of application https://github.com/TechPrimers/docker-mysql-spring-boot-example on minikube with help GitHub Actions.
2. Load balance is done with Kubernetes Service resource.
3. For auto healing there are `livenessProbe` and `readinessProbe`.
4. MySQL is deployed with stable helm chart `stable/mysql`.
5. Add high availability:
    1. There is a helm chart [incubator/mysqlha](https://github.com/helm/charts/tree/master/incubator/mysqlha) we can use this helm chart when it would be production ready (moved to `stable`).
    2. Add persictance volume claime, this will prevent loosing data when database pod is recreated.  To do this just add additional argument `--set persistence.enabled=true` to `dependencies/deploy-mysql.sh`.
6. CI deployment for application is defined in [Github Action for bogdangi/docker-mysql-spring-boot-example](https://github.com/bogdangi/docker-mysql-spring-boot-example/blob/master/.github/workflows/java.yml).
7. To split deployment into prod/qa/dev environments just copy `deployment` directory to `deployment-{prod|qa|dev}` and `dependencies` directory to `dependencies-{prod|qa|dev}`.
8. For monitoring and logging is recommended to use Prometheus/Loki/Grafana.


# Overview

## Dependencies

In order to manage dependencies there is a directory `dependencies`.

Script to install all dependencies: `dependencies/install-all-dependencies.sh`

Script to install helm: `dependencies/install-helm.sh`

Script to deploy MySQL: `dependencies/deploy-mysql.sh`


## Deploy and check application

For deploying application there is a directory `deployment`

Script to deploy application: `deployment/deploy.sh`

For checking application there is a directory `tests`

Script to run all checks: `tests/run-all-tests.sh`
