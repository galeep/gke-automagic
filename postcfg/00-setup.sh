#!/bin/bash

# We are inconsistent about what we init here :(
gcloud config set compute/zone us-west1-a
gcloud container clusters get-credentials wordpress-cluster 
kubectl get namespaces
helm init 
helm=$?
if [ $helm != "0" ]; then 
    echo "Could not initialize helm. Please get helm and try again"
    exit 1 
fi
