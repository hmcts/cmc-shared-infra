module "cmc-bulk-print-fail-alert" {
  source = "git@github.com:hmcts/moj-module-metric-alert"

  app_insights_name = "${var.env == "prod" ? "cmc-prod" : "cmc-sandbox"}"

  alert_name = "Bulk print failure"
  alert_desc = "Triggers when a bulk print failure event is received in a 5 minute poll."
  app_insights_query = "customEvents | where name == \"Bulk print failed\""
//  frequency_in_minutes = "5"
//  time_window_in_minutes = "5"
//  severity_level = "3"
  action_group_name = "BPF_alert"
//  trigger_threshold_operator = "GreaterThan"
  trigger_threshold = "0"
  resourcegroup_name = "${var.env == "prod" ? "cmc-prod" : "cmc-sandbox"}"
}
