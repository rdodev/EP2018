#!/bin/bash
# DEPLOYING & SCALING AN APP

# Assumes https://gitlab.com/rdodev/whereplot is checked out
cd whereplot
kubectl apply -f deployment/
kubectl get pods

# NOW LET'S SCALE"
# defaults to 3
kubectl deploy scale frontend --replicas=5
kubectl get deploy frontend
# This may take a little while to show them all
kubectl get pods

# Scale back down to one replica
kubectl scale scale frontend --replicas=1
kubectl get pods
