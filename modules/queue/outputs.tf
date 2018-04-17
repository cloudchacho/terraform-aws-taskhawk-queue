output "sqs_queue_arn" {
  value = "${aws_sqs_queue.sqs_queue.arn}"
}

output "sqs_queue_name" {
  value = "${aws_sqs_queue.sqs_queue.name}"
}

output "dlq_arn" {
  value = "${aws_sqs_queue.dlq.arn}"
}

output "dlq_name" {
  value = "${aws_sqs_queue.dlq.name}"
}

output "high_message_alert_id" {
  value = "${module.alerts.high_message_alert_id}"
}

output "dlq_alert_id" {
  value = "${module.alerts.dlq_alert_id}"
}
