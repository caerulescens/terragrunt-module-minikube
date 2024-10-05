include "root" {
  path = find_in_parent_folders()
}

include "common" {
  path   = "${dirname(find_in_parent_folders())}/_common/minikube.hcl"
  expose = true
}

terraform {
  source = "${include.common.locals.base_source_url}?ref=${include.common.locals.ref}"
}

inputs = {}
