# terragrunt-module-minikube

A [`terragrunt`](https://github.com/gruntwork-io/terragrunt) module for [`minikube`](https://github.com/kubernetes/minikube).

## Install

| name                                                     |
|----------------------------------------------------------|
| [pyenv](https://github.com/pyenv/pyenv)                  |
| [poetry](https://github.com/python-poetry)               |
| [docker](https://github.com/docker)                      |
| [kubectl](https://github.com/kubernetes/kubectl)         |
| [terragrunt](https://github.com/gruntwork-io/terragrunt) |
| [terraform](https://github.com/hashicorp/terraform)      |
| [opentofu](https://github.com/opentofu/opentofu)         |
| [pre-commit](https://github.com/pre-commit/pre-commit)   |

```shell
pre-commit install
poetry install
poetry shell
```

## Usage

Configure:
```shell
cat <<EOF > live/minikube/local/dev/default/terragrunt-module-minikube/terraform.tfvars
minikube_clusters = {
  "minikube": {
    "driver": "docker",
    "nodes": 3,
    "cpu": 4,
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
kustomize build --enable-helm k12s/
helm install --create-namespace --namespace argocd argocd k12s/charts/argo-cd-v5.49.0/argo-cd
kustomize build --enable-helm k12s/app-of-apps/overlays/default | kubectl apply -f -
```

Check:
```shell
pre-commit run
```
