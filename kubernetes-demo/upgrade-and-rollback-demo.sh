#!/bin/bash
# UPDATING CODE IN AN IMAGE

# Assumes https://gitlab.com/rdodev/iipcy is cloned
cd iipcy/is-it-pycon-yet/

# Assumes you have a local registry running
docker build . -t localhost:5000/iipcy:v1
docker push localhost:5000/iipcy:v1

# In the 'iipcy' directory
cd ..
# Applies all the YAML files in the current directory
kubectl apply -f .

# Opens a browser with the mapped address of the iipcy service
minikube service iipcy


# Edit the iipcy/is-it-pycon-yet/main.py file to have a change
# A good visual representation is adding an entry in the `out`
# variable


cd ./is-it-pycon-yet/
docker build ./is-it-pycon-yet/ -t localhost:5000/iipcy:v2
docker push localhost:5000/iipcy:v2

# Update the deployment to match the new image's version
# Can also be accomplished by updating the YAML file
kubectl set image deployment iipcy  iipcy=localhost:5000/iipcy:v2

# Wait while the old pods get cycled out
sleep 30

# Check the service again, and your new field should be there
minikube service iipcy

# Now you can check rollout history
kubectl rollout history deployment iipcy

# You can also roll back to the previous image
kubectl rollout undo deployment iipcy

# You can view the status of the undo, too.
kubectl rollout status deployment iipcy
