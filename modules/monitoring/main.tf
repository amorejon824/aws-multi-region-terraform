resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.env}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            ["AWS/ApplicationELB", "HealthyHostCount", "TargetGroup", var.target_group_suffix, "LoadBalancer", var.lb_suffix],
            [".", "UnHealthyHostCount", ".", ".", ".", "."]
          ]
          view    = "timeSeries"
          stacked = false
          region  = var.region
          title   = "${var.env} ALB Target Health"
          period  = 60
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "unhealthy_hosts" {
  alarm_name          = "${var.env}-alb-unhealthy-hosts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Average"
  threshold           = 0
  alarm_description   = "Alarm when ALB has unhealthy hosts"
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = var.target_group_suffix
    LoadBalancer = var.lb_suffix
  }
}