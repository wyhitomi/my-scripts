#!/bin/bash

. ../.config

kubectl create namespace $NAMESPACE

kubectl --namespace=$NAMESPACE create secret docker-registry gcr-json-key \
          --docker-server=https://gcr.io \
          --docker-username=_json_key \
          --docker-password="$(cat $JSON_PATH)" \
          --docker-email=$EMAIL

kubectl --namespace=dev patch serviceaccount default \
          -p '{"imagePullSecrets": [{"name": "gcr-json-key"}]}'

kubectl --namespace=dev get serviceaccount default -o yaml