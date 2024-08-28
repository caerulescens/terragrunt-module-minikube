# terragrunt-module-minikube

Terragrunt module for minikube.

## Install

[//]: # (todo: terragrunt, helm, kustomize, terraform/tofu, ..., etc)

## Usage

Run `terragrunt`:
```shell
terragrunt init
terragrunt plan
terragrunt apply
```

Run `kustomize`:
```shell
kustomize build --enable-helm
```

Install `argocd`:
```shell
helm install --create-namespace --namespace argocd argocd charts/argo-cd-v5.49.0/argo-cd
```

Install `app-of-apps`:
```shell
kustomize build --enable-helm k12s/app-of-apps/overlays/default | kubectl apply -f -
```
