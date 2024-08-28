locals {
  base_source_url    = "git::git@github.com:genericware/terraform-module-minikube.git"
  ref                = "master"
  kubernetes_version = "1.30.0"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF

provider "minikube" {
  kubernetes_version = "${local.kubernetes_version}"
}

EOF
}

remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    
    path = "${get_parent_terragrunt_dir()}/${path_relative_to_include()}/terraform.tfstate"
    
  }
}

inputs = {}
