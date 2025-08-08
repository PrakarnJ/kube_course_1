#!/bin/bash

set -e

echo "Starting minikube..."
minikube start

echo "Enabling nginx ingress addon..."
minikube addons enable ingress

echo "Waiting for ingress controller to be ready..."
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s

echo "Applying dashboard ingress manifest..."
kubectl apply -f dashboard-ingress.yaml

echo "Adding dashboard.com to /etc/hosts (requires sudo)..."
if ! grep -q "dashboard.com" /etc/hosts; then
  echo "127.0.0.1 dashboard.com" | sudo tee -a /etc/hosts
else
  echo "dashboard.com already exists in /etc/hosts"
fi

echo "Starting minikube tunnel (leave this terminal open)..."
echo "You can now access http://dashboard.com in your browser."
minikube tunnel