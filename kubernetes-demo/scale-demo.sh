#!/bin/bash
# DEPLOYING & SCALING AN APP

# import demo
. ../demo-magic.sh -c

# Assumes https://gitlab.com/rdodev/whereplot is checked out
cd ../../whereplot
pe 'kubectl apply -f deployment/'
pe 'kubectl get pods'
pe 'minikube service frontend'

# NOW LET'S SCALE"
# defaults to 3
pe 'kubectl scale deployment frontend --replicas=5'
pe 'kubectl get deployment frontend'
# This may take a little while to show them all
pe 'kubectl get pods'

# Scale back down to one replica
pe 'kubectl scale deployment frontend --replicas=1'
pe 'kubectl get pods'

kubectl delete deployment frontend
kubectl delete service frontend