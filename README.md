# terragrunt-module-minikube

A [`terragrunt`](https://github.com/gruntwork-io/terragrunt) module for [`minikube`](https://github.com/kubernetes/minikube).

## Install

| name                                                      |
|-----------------------------------------------------------|
| [docker](https://github.com/docker)                       |
| [minikube](https://github.com/kubernetes/minikube)        |
| [kubectl](https://github.com/kubernetes/kubectl)          |
| [kustomize](https://github.com/kubernetes-sigs/kustomize) |
| [helm](https://github.com/helm/helm)                      |
| [terragrunt](https://github.com/gruntwork-io/terragrunt)  |
| [terraform](https://github.com/hashicorp/terraform)       |
| [opentofu](https://github.com/opentofu/opentofu)          |
| [pre-commit](https://github.com/pre-commit/pre-commit)    |

```shell
pre-commit install
```

## Usage

Build:
```shell
kustomize build --enable-helm k12s/
```

Configure:
```shell
cat <<EOF > live/minikube/local/dev/default/terragrunt-module-minikube/terraform.tfvars
minikube_clusters = {
  "minikube": {
    "driver": "docker",
    "nodes": 3,
    "cpus": 4,
    "memory": "4096mb"
  }
}
EOF
```

Run:
```shell
terragrunt init --terragrunt-working-dir live/minikube/local/dev/default/terragrunt-module-minikube
terragrunt plan --terragrunt-working-dir live/minikube/local/dev/default/terragrunt-module-minikube
terragrunt apply --terragrunt-working-dir live/minikube/local/dev/default/terragrunt-module-minikube
helm install --create-namespace --namespace argocd argocd k12s/charts/argo-cd-v5.49.0/argo-cd
kustomize build --enable-helm k12s/app-of-apps/overlays/default | kubectl apply -f -
```

Check:
```shell
pre-commit run
```
