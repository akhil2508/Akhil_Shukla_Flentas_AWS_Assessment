provider "aws" {
  region = "eu-north-1"
  alias = "eu-north-1"
}

resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  provider = aws.eu_north_1
  alarm_name = "Akhil_Shukla_Billing_Alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = "1"
  metric_name = "EstimatedCharges"
  namespace = "AWS/Billing"
  period = "21600"
  statistic = "Maximum"
  threshold = "100"
  alarm_description = "Alert triggers when estimated AWS charges exceed ₹100 to prevent accidental costs."
  actions_enabled = true

  dimensions = {
    Currency = "INR"
  }
}