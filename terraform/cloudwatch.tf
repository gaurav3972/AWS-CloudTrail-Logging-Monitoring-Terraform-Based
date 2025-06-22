resource "aws_cloudwatch_log_group" "trail_logs" {
  name              = "/aws/cloudtrail/logs"
  retention_in_days = 90
}

resource "aws_cloudwatch_metric_filter" "root_login_filter" {
  name           = "RootLoginFilter"
  log_group_name = aws_cloudwatch_log_group.trail_logs.name
  pattern        = "{ ($.userIdentity.type = \"Root\") && ($.eventName = \"ConsoleLogin\") && ($.responseElements.ConsoleLogin = \"Success\") }"

  metric_transformation {
    name      = "RootLoginEvent"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_alarm" "root_login_alarm" {
  alarm_name          = "RootLoginAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_metric_filter.root_login_filter.metric_transformation[0].name
  namespace           = "CloudTrailMetrics"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm for root login activity"
  alarm_actions       = [aws_sns_topic.alerts.arn]
}
