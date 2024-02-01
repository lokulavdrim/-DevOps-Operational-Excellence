resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "75"
  alarm_description   = "This metric monitors EC2 CPU utilization"
  actions_enabled     = true

  dimensions = {
    InstanceId = "i-"  
  }

  # Specify the action to take when the alarm state changes
  alarm_actions = [
    "arn:aws:sns:us-east-1:123456789012:MyNotificationTopic"  # Replace with SNS topic ARN
  ]


}
