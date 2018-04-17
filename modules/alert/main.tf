resource "aws_cloudwatch_metric_alarm" "high_message_alert" {
  alarm_name          = "${title(var.queue)} Taskhawk queue message count too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = "300"                                                       // Seconds
  threshold           = "${var.queue_alarm_high_message_count_threshold}"           // Number of messages
  statistic           = "Average"
  treat_missing_data  = "ignore"

  dimensions {
    QueueName = "${var.queue}"
  }

  alarm_description = "Alert if Taskhawk SQS queue too high"
  alarm_actions     = "${var.queue_alarm_high_message_count_actions}"
  ok_actions        = "${var.queue_ok_high_message_count_actions}"
}

resource "aws_cloudwatch_metric_alarm" "dlq_alert" {
  alarm_name          = "${title(var.queue)} Taskhawk DLQ is non-empty"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ApproximateNumberOfMessagesVisible"

  evaluation_periods = "1"
  namespace          = "AWS/SQS"
  period             = "60"      // Seconds
  threshold          = "1"       // Number of messages
  statistic          = "Sum"
  treat_missing_data = "ignore"

  dimensions {
    QueueName = "${var.queue}-DLQ"
  }

  alarm_description = "Alert if Taskhawk DLQ is non-empty"
  alarm_actions     = "${var.dlq_alarm_high_message_count_actions}"
  ok_actions        = "${var.dlq_ok_high_message_count_actions}"
}
