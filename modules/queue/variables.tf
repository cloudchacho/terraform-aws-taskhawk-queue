variable "queue" {
  description = "Queue name (e.g. taskhawk-dev-myapp); unique across your infra"
}

variable "max_receive_count" {
  description = "Maximum number of receives allowed before message is moved to the dead-letter-queue"
}

variable "tags" {
  description = "Tags to attach to the SQS queues"
}

variable "alerting" {
  description = "Should Cloudwatch alerts be generated?"
}

variable "queue_alarm_high_message_count_threshold" {
  description = "Threshold for alerting on high message count in main queue"
}

variable "queue_alarm_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for main queue Alarm for high message count"
  type        = "list"
}

variable "queue_ok_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for main queue OK for high message count"
  type        = "list"
}

variable "dlq_alarm_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for dead-letter queue Alarm for high message count"
  type        = "list"
}

variable "dlq_ok_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for dead-letter queue OK for high message count"
  type        = "list"
}
