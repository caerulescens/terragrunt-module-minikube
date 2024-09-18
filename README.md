# terragrunt-module-minikube

A [`terragrunt`](https://github.com/gruntwork-io/terragrunt) module for [`minikube`](https://github.com/kubernetes/minikube).

## Install

| name                                                      |
|-----------------------------------------------------------|
| [docker](https://github.com/docker)                       |
| [minikube](https://github.com/kubernetes/minikube)        |
| [kubectl](https://github.com/kubernetes/kubectl)          |
| [terragrunt](https://github.com/gruntwork-io/terragrunt)  |
| [terraform](https://github.com/hashicorp/terraform)       |
| [opentofu](https://github.com/opentofu/opentofu)          |
| [pre-commit](https://github.com/pre-commit/pre-commit)    |

```shell
pre-commit install
```

## Usage

Configure:
```shell
cat <<EOF > live/minikube/local/dev/default/docker/terraform.tfvars
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

Create:
```shell
terragrunt init --terragrunt-working-dir live/minikube/local/dev/default/docker
terragrunt plan --terragrunt-working-dir live/minikube/local/dev/default/docker
terragrunt apply --terragrunt-working-dir live/minikube/local/dev/default/docker
```

Remove:
```shell
terragrunt destroy --terragrunt-working-dir live/minikube/local/dev/default/docker
```

Check:
```shell
pre-commit run
```
