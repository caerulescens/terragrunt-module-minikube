locals {
  # automatically load platform variables
  platform_vars = read_terragrunt_config(find_in_parent_folders("platform.hcl"))

  # automatically load region variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # automatically load environment variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))

  # automatically load environment variables
  profile_vars = read_terragrunt_config(find_in_parent_folders("profile.hcl"))
}

# merge platform, region, environment, and profile vars
inputs = merge(
  local.platform_vars.locals,
  local.region_vars.locals,
  local.environment_vars.locals
  local.profile_vars.locals
)
