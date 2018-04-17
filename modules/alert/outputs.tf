output "high_message_alert_id" {
  value = "${aws_cloudwatch_metric_alarm.high_message_alert.id}"
}

output "dlq_alert_id" {
  value = "${aws_cloudwatch_metric_alarm.dlq_alert.id}"
}
