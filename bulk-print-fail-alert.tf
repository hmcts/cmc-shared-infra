module "cmc-bulk-print-fail-alert" {
  source = "git@github.com:hmcts/cnp-module-metric-alert"
  location = "${var.location}"

  app_insights_name = "cmc-${var.env}"

  alert_name = "Bulk print failure - CMC"
  alert_desc = "Triggers when a bulk print failure event is received from CMC in a 5 minute poll."
  app_insights_query = "customEvents | where name == \"Bulk print failed\""
  frequency_in_minutes = 5
  time_window_in_minutes = 5
  severity_level = "3"
  action_group_name = "Bulk Print Fail Alert - ${var.env}"
  custom_email_subject = "CMC Bulk Print Failure"
  trigger_threshold_operator = "GreaterThan"
  trigger_threshold = 0
  resourcegroup_name = "cmc-${var.env}"
}
