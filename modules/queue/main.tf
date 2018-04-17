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

module "alerts" {
  count = "${var.alerting == "true" ? 1 : 0}"

  source = "../alert"

  queue = "${aws_sqs_queue.sqs_queue.name}"

  queue_alarm_high_message_count_threshold = "${var.queue_alarm_high_message_count_threshold}"
  queue_ok_high_message_count_actions      = "${var.queue_ok_high_message_count_actions}"
  queue_alarm_high_message_count_actions   = "${var.queue_alarm_high_message_count_actions}"
  dlq_ok_high_message_count_actions        = "${var.dlq_ok_high_message_count_actions}"
  dlq_alarm_high_message_count_actions     = "${var.dlq_alarm_high_message_count_actions}"
}
