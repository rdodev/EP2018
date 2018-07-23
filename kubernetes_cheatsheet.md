# Kubernetes client (kubectl) basics

 * `kubectl version`
 * `kubectl cluster-info`
 * `kubectl config get-contexts`

# Object Queries

 * `kubectl get nodes`
 * `kubectl get node <NodeName>`
 * `kubectl get node <NodeName> -o wide`
 * `kubectl describe node <NodeName>`

 * `kubectl get ns`
 * `kubectl describe ns <nsName>`
 
 * `kubectl get pods`
 * `kubectl get pods --all-namespaces`
 * `kubectl get pod <podName>`
 * `kubectl delete pod <podName>`
 * `kubectl get po <podName> -n <nsName> -o yaml`

# Diagnostics Queries

 * `kubectl logs <podName> -n <nsName>`
 * `kubectl logs <podName> -n <nsName> -c <constainerName>`
 * `kubectl exec <podName> -n <nsName> <COMMAND>`

# Create/Apply Queries

 * `kubectl create namespace <nsName>`
 * `kubectl apply -f <file>`
 * Modify definition
 * `kubectl apply -f <file>`

 # Object Definition Help

 * `kubectl explain pod`
 * `kubectl explain pod.metadata`
 * `kubectl explain pod.metadata.annotations`

