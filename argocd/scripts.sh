# bin/bash
# Create "agocd" NameSpace and instal ArgoCD there
# Create "app" NameSpace for deployment
# Create "datree" NameSpace for datree

kubectl create namespace argocd
kubectl create namespace app
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -n argocd -f argocd/application.yaml