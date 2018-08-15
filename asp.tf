
locals {
  ase_name = "core-compute-${var.env}"

  common_tags = {
    team_name    = "${var.team_name}"
    team_contact = "${var.team_contact}"
  }
}

// TODO remove this
module "appServicePlanA" {
  source              = "git@github.com:hmcts/moj-module-app-service-plan?ref=infra_versions"
  location            = "UK South"
  env                 = "${var.env}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  asp_capacity        = "${var.asp_capacity}"
  asp_name            = "${var.product}"
  ase_name            = "${local.ase_name}"
  tag_list            = "${local.common_tags}"
}