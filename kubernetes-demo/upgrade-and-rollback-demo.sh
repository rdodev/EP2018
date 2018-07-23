#!/bin/bash
# UPDATING CODE IN AN IMAGE

. ../demo-magic.sh -c

# Assumes https://gitlab.com/rdodev/iipcy is cloned
cd ../../iipcy/is-it-pycon-yet/

# Assumes you have a local registry running
pe 'docker build . -t localhost:5000/iipcy:v1'
pe 'docker push localhost:5000/iipcy:v1'

# In the 'iipcy' directory
cd ..
# Applies all the YAML files in the current directory
pe 'kubectl apply -f .'

# Opens a browser with the mapped address of the iipcy service
pe 'minikube service iipcy'


# Edit the iipcy/is-it-pycon-yet/main.py file to have a change
# A good visual representation is adding an entry in the `out`
# variable


pe 'docker build -t localhost:5000/iipcy:v2 ./is-it-pycon-yet/'
pe 'docker push localhost:5000/iipcy:v2'

# Update the deployment to match the new image's version
# Can also be accomplished by updating the YAML file
pe 'kubectl set image deployment iipcy  iipcy=localhost:5000/iipcy:v2'


# Check the service again, and your new field should be there
pe 'minikube service iipcy'

# Now you can check rollout history
pe 'kubectl rollout history deployment iipcy'

# You can also roll back to the previous image
pe 'kubectl rollout undo deployment iipcy'

# You can view the status of the undo, too.
pe 'kubectl rollout status deployment iipcy'

# cleaup

kubectl delete deployment iipcy
kubectl delete service iipcy