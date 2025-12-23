#!/bin/bash

set -e

echo "🚀 Installing ArgoCD using Helm..."

# 1️⃣ Check prerequisites
command -v kubectl >/dev/null 2>&1 || {
  echo "❌ kubectl not found"
  exit 1
}

command -v helm >/dev/null 2>&1 || {
  echo "❌ helm not found"
  exit 1
}

# 2️⃣ Add Argo Helm repo
echo "📦 Adding Argo Helm repo..."
helm repo add argo https://argoproj.github.io/argo-helm >/dev/null
helm repo update >/dev/null

# 3️⃣ Create namespace if not exists
echo "📂 Creating namespace argocd (if not exists)..."
kubectl get namespace argocd >/dev/null 2>&1 || \
kubectl create namespace argocd

# 4️⃣ Install / Upgrade ArgoCD
echo "⚙️ Installing ArgoCD..."
helm upgrade --install argocd argo/argo-cd \
  --namespace argocd \
  --wait

# 5️⃣ Verify installation
echo "✅ ArgoCD Pods:"
kubectl get pods -n argocd

echo
echo "✅ ArgoCD Services:"
kubectl get svc -n argocd

echo
echo "🎉 ArgoCD installation completed successfully!"
