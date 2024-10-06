# terragrunt-module-minikube

A [`terragrunt`](https://github.com/gruntwork-io/terragrunt) module for [`minikube`](https://github.com/kubernetes/minikube).

## Install

| Name                                                   |
|--------------------------------------------------------|
| [docker](https://github.com/docker)                    |
| [kubectl](https://github.com/kubernetes/kubectl)       |
| [minikube](https://github.com/kubernetes/minikube)     |
| [tenv](https://github.com/tofuutils/tenv)              |
| [pre-commit](https://github.com/pre-commit/pre-commit) |

```shell
pre-commit install
```

## Usage

Configure:
```shell
cat <<EOF > ./live/dev/cluster/terraform.tfvars
minikube_clusters = {
  "minikube": {
    "ha": false
    "driver": "docker"
    "nodes": 3
    "cpus": 2
    "memory": "2048mb"
    "disk_size": "32768mb"
  }
}
EOF
```

Validate:
```shell
terragrunt validate-inputs --terragrunt-working-dir live/dev/cluster
```

Init:
```shell
terragrunt init --terragrunt-working-dir live/dev/cluster
```

Plan:
```shell
terragrunt plan --terragrunt-working-dir live/dev/cluster
```

Apply:
```shell
terragrunt apply --terragrunt-working-dir live/dev/cluster
```

Destroy:
```shell
terragrunt destroy --terragrunt-working-dir live/dev/cluster
```

## Development

Validate:
```shell
terragrunt hclvalidate
```

Format:
```shell
terragrunt hclfmt
```

Check:
```shell
pre-commit run
```
