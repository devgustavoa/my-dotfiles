# Blazingly Fast Kubernetes (kubectl) Commands

## Cluster & Configuration

- `kubectl cluster-info` displays the cluster's endpoints and status.
- `kubectl config view` shows the merged kubeconfig settings.
- `kubectl config get-contexts` lists all available cluster contexts.
- `kubectl config current-context` displays the currently active context.
- `kubectl config use-context [name]` switches to a different cluster context.
- `kubectl top nodes` shows CPU and memory usage for all nodes (requires metrics-server).

## Pods (The Smallest Deployable Units)

- `kubectl get pods` lists all pods in the current namespace.
- `kubectl get pods -A` lists all pods across all namespaces.
- `kubectl get pods -o wide` lists pods with extra details (like IP address and Node).
- `kubectl describe pod [pod_name]` shows incredibly detailed state and event history for a pod.
- `kubectl delete pod [pod_name]` deletes a specific pod (if managed by a deployment, it will recreate itself).
- `kubectl get pods --watch` streams updates to the pod list in real-time.

## Deployments & Replicas (Managing Pods)

- `kubectl get deployments` lists all deployments in the current namespace.
- `kubectl describe deployment [deploy_name]` shows details and event history for a deployment.
- `kubectl scale deployment [deploy_name] --replicas=[count]` scales the number of running pods up or down.
- `kubectl rollout status deployment/[deploy_name]` watches the status of a rolling update.
- `kubectl rollout undo deployment/[deploy_name]` rolls back a deployment to the previous version.
- `kubectl delete deployment [deploy_name]` deletes the deployment and all its managed pods.

## Services & Networking (Exposing Pods)

- `kubectl get svc` (or `services`) lists all services in the current namespace.
- `kubectl describe svc [svc_name]` shows details like port mappings and target endpoints.
- `kubectl port-forward svc/[svc_name] [local_port]:[cluster_port]` forwards a local port to a cluster service for testing.
- `kubectl port-forward pod/[pod_name] [local_port]:[cluster_port]` forwards a local port directly to a specific pod.

## Debugging & Interaction

- `kubectl logs [pod_name]` fetches the logs of a pod.
- `kubectl logs -f [pod_name]` follows the log output in real-time.
- `kubectl logs [pod_name] -c [container_name]` gets logs for a specific container (if the pod has multiple).
- `kubectl logs --previous [pod_name]` gets logs from a previously crashed instance of the pod.
- `kubectl exec -it [pod_name] -- /bin/sh` opens an interactive shell inside a running pod.
- `kubectl cp [local_file_path] [pod_name]:[container_path]` copies a file from your local machine into a pod.
- `kubectl cp [pod_name]:[container_path] [local_file_path]` copies a file from a pod to your local machine.

## Namespaces (Logical Partitions)

- `kubectl get ns` (or `namespaces`) lists all namespaces.
- `kubectl create ns [name]` creates a new namespace.
- `kubectl get pods -n [namespace]` lists pods in a specific namespace.
- `kubectl config set-context --current --namespace=[namespace]` sets a default namespace for your current context so you don't have to type `-n` every time.

## Applying & Managing Configurations (Declarative)

- `kubectl apply -f [file.yaml]` creates or updates resources defined in a YAML file.
- `kubectl apply -f [directory]/` applies all YAML files in a directory.
- `kubectl delete -f [file.yaml]` deletes the resources defined in the YAML file.
- `kubectl diff -f [file.yaml]` shows the difference between the running cluster state and the YAML file.
