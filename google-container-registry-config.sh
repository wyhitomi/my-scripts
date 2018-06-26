#!/bin/bash

NAMESPACE=dev
EMAIL="wagner.hitomi@hubchain.io"
JSON_PATH="~/hubchain/certificates/gcloud/HubChain-7f71be5de257.json"

kubectl create namespace $NAMESPACE

kubectl --namespace=$NAMESPACE create secret docker-registry gcr-json-key \
          --docker-server=https://gcr.io \
          --docker-username=_json_key \
          --docker-password="$(cat $JSON_PATH)" \
          --docker-email=$EMAIL