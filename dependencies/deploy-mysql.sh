#!/usr/bin/env bash

helm install \
        db  \
        stable/mysql \
        --version 1.6.2 \
        --set mysqlUser=my-user,mysqlDatabase=my-database
