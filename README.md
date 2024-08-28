# terragrunt-module-minikube

Terragrunt module for minikube.

## Install

[//]: # (todo: links and descriptions)
| name                                                   | description                                            |
|--------------------------------------------------------|--------------------------------------------------------|
| [pyenv](https://github.com/pyenv/pyenv)                | Python version management                              |
| [poetry](https://github.com/python-poetry)             | Python packaging and dependency management             |
| [tenv](https://github.com/tofuutils/tenv)              | OpenTofu, Terraform, and Terragrunt version management |
| [tflint](https://github.com/terraform-linters/tflint)  | Terraform linter                                       |
| [pre-commit](https://github.com/pre-commit/pre-commit) | Multi-language automated checks                        |
| [docker]()                                             |                                                        |
| [kubectl]()                                            |                                                        |
| [terragrunt]()                                         |                                                        |
| [terraform]()                                          |                                                        |
| [opentofu]()                                           |                                                        |
| [argocd]()                                             |                                                        |
| [istioctl]()                                           |                                                        |
| [kn]()                                                 |                                                        |
| [func]()                                               |                                                        |
| [kcat]()                                               |                                                        |

Development:
```shell
pre-commit install
poetry install
poetry shell
```

Production:
```shell
poetry install --without dev
```

## Usage

Run:
```shell
cd live/minikube/local/dev/default/terragrunt-module-minikube
terragrunt init
terragrunt plan
terragrunt apply
kustomize build --enable-helm
helm install --create-namespace --namespace argocd argocd charts/argo-cd-v5.49.0/argo-cd
kustomize build --enable-helm k12s/app-of-apps/overlays/default | kubectl apply -f -
```

Test:
```shell
pytest .
```

Doc:
```shell
make -C docs html
```

Check:
```shell
pre-commit run
```
