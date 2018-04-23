resource "aws_sqs_queue" "dlq" {
  name                      = "TASKHAWK-${var.queue}-DLQ"
  message_retention_seconds = 1209600                     // 14 days - the maximum allowed

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "sqs_queue" {
  name                      = "TASKHAWK-${var.queue}"
  delay_seconds             = 0
  message_retention_seconds = 86400                   // one day
  receive_wait_time_seconds = 0

  // add + 0 to max_receive_count for force typecast
  redrive_policy = <<POLICY
{
  "deadLetterTargetArn": "${aws_sqs_queue.dlq.arn}",
  "maxReceiveCount": ${var.max_receive_count + 0}
}
POLICY

  tags = "${var.tags}"
}

resource "aws_cloudwatch_metric_alarm" "high_message_alert" {
  count = "${var.alerting == "true" ? 1 : 0}"

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
  count = "${var.alerting == "true" ? 1 : 0}"

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
