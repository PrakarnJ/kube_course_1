# Kubernetes Tutorial

This repository contains resources and sample code for learning and experimenting with Kubernetes.

## Contents

- Example Kubernetes manifests (Deployments, Services, etc.)
- Sample application source code
- Step-by-step guides for deploying and managing applications on Kubernetes

## Getting Started

1. **Clone this repository:**
   ```sh
   git clone https://github.com/your-username/kube_tutorial.git
   cd kube_tutorial
   ```

2. **Install prerequisites:**
   - [Docker Desktop](https://www.docker.com/products/docker-desktop/) (with Kubernetes enabled) or [Minikube](https://minikube.sigs.k8s.io/docs/)
   - [kubectl](https://kubernetes.io/docs/tasks/tools/)

3. **Start your Kubernetes cluster:**
   - For Docker Desktop: Enable Kubernetes in settings.
   - For Minikube:
     ```sh
     minikube start
     ```

4. **Apply sample manifests:**
   ```sh
   kubectl apply -f k8s-configuration/
   ```

5. **Check resources:**
   ```sh
   kubectl get all
   ```

## Example: Deploying MongoDB and Mongo Express

This repo includes a sample MongoDB database and a Mongo Express UI, using Kubernetes manifests in [`k8s-configuration/`](k8s-configuration):

1. **Create secrets and configmaps:**
   ```sh
   kubectl apply -f k8s-configuration/mongo-secret.yaml
   kubectl apply -f k8s-configuration/mongo-configmap.yaml
   ```

2. **Deploy MongoDB and Mongo Express:**
   ```sh
   kubectl apply -f k8s-configuration/mongo.yaml
   kubectl apply -f k8s-configuration/mongo-express.yaml
   ```

3. **Access Mongo Express:**
   - If using Minikube, run:
     ```sh
     minikube service mongo-express-service --url
     ```
   - Open the printed URL in your browser.

## Kubernetes Dashboard with Ingress

To set up the Kubernetes Dashboard with an NGINX Ingress and custom domain:

1. **Run the setup script:**
   ```sh
   cd k8s-configuration
   bash setup-dashboard.sh
   ```
   This will:
   - Start Minikube (if not running)
   - Enable the ingress addon
   - Deploy the dashboard ingress
   - Add `dashboard.com` to your `/etc/hosts`
   - Start a tunnel for LoadBalancer access

2. **Access the dashboard:**
   - Visit [http://dashboard.com](http://dashboard.com) in your browser.

## Folder Structure

- `k8s-configuration/` — Kubernetes YAML files and setup scripts
- `src/` — Sample application source code
- `README.md` — This guide

## Useful Commands

- View pods: `kubectl get pods`
- View services: `kubectl get svc`
- Describe a resource: `kubectl describe <resource> <name>`
- Delete resources: `kubectl delete -f k8s-configuration/`
- View deployments: `kubectl get deployments`
- View ingress: `kubectl get ingress`

## References

- [Kubernetes Official Documentation](https://kubernetes.io/docs/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

---

Feel free to contribute or open issues for questions!