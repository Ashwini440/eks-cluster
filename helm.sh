#!/bin/bash

# Add Helm repositories for Prometheus and Grafana
echo "Adding Prometheus Helm repo..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
# Install Prometheus (Choose LoadBalancer or NodePort based on your preference)
echo "Installing Prometheus..."
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace default \
  --create-namespace \
  --set prometheus.server.service.type=LoadBalancer # Or use NodePort

# Install Grafana (Choose LoadBalancer or NodePort based on your preference)

# Wait for resources to be deployed
echo "Waiting for deployments to complete..."
kubectl get pods -n default --watch

# Check the list of installed Helm releases
echo "Listing Helm releases..."
helm list -n default

# Check all resources in the default namespace
echo "Getting all resources in the default namespace..."
kubectl get all -n default

# Check the status of Prometheus and Grafana services
echo "Checking Prometheus service..."
kubectl get svc -n default

echo "Checking Grafana service..."
kubectl get svc -n default

# Retrieve Grafana admin password from Kubernetes secrets
echo "Retrieving Grafana admin password..."
kubectl get secret grafana -n default -o jsonpath="{.data.admin-password}" | base64 --decode

# Edit the Prometheus service to set the type to LoadBalancer (if not already done)
echo "Editing Prometheus service type to LoadBalancer..."
kubectl edit svc prometheus-kube-prometheus-prometheus -n default

# Edit the Grafana service type to LoadBalancer (if not already done)
echo "Editing Grafana service type to LoadBalancer..."
kubectl edit svc prometheus-grafana -n default

# Print the current services and their status
echo "Final list of services in the default namespace..."
kubectl get svc -n default
