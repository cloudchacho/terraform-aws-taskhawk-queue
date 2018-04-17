output "default_queue_arn" {
  value       = "${module.queue_default.sqs_queue_arn}"
  description = "ARN for the default queue"
}

output "default_queue_name" {
  value       = "${module.queue_default.sqs_queue_name}"
  description = "Name of the default queue"
}

output "default_dlq_arn" {
  value       = "${module.queue_default.dlq_arn}"
  description = "ARN of the default DLQ"
}

output "default_dlq_name" {
  value       = "${module.queue_default.dlq_name}"
  description = "Name of the default DLQ"
}

output "high_priority_queue_arn" {
  value       = "${module.queue_high_priority.sqs_queue_arn}"
  description = "ARN for the high-priority queue"
}

output "high_priority_queue_name" {
  value       = "${module.queue_high_priority.sqs_queue_name}"
  description = "Name of the high-priority queue"
}

output "high_priority_dlq_arn" {
  value       = "${module.queue_high_priority.dlq_arn}"
  description = "ARN of the high-priority DLQ"
}

output "high_priority_dlq_name" {
  value       = "${module.queue_high_priority.dlq_name}"
  description = "Name of the high-priority DLQ"
}

output "low_priority_queue_arn" {
  value       = "${module.queue_low_priority.sqs_queue_arn}"
  description = "ARN for the low-priority queue"
}

output "low_priority_queue_name" {
  value       = "${module.queue_low_priority.sqs_queue_name}"
  description = "Name of the low-priority queue"
}

output "low_priority_dlq_arn" {
  value       = "${module.queue_low_priority.dlq_arn}"
  description = "ARN of the low-priority DLQ"
}

output "low_priority_dlq_name" {
  value       = "${module.queue_low_priority.dlq_name}"
  description = "Name of the low-priority DLQ"
}

output "bulk_queue_arn" {
  value       = "${module.queue_bulk.sqs_queue_arn}"
  description = "ARN for the bulk queue"
}

output "bulk_queue_name" {
  value       = "${module.queue_bulk.sqs_queue_name}"
  description = "Name of the bulk queue"
}

output "bulk_dlq_arn" {
  value       = "${module.queue_bulk.dlq_arn}"
  description = "ARN of the bulk DLQ"
}

output "bulk_dlq_name" {
  value       = "${module.queue_bulk.dlq_name}"
  description = "Name of the bulk DLQ"
}

output "policy_arn" {
  value       = "${element(concat(aws_iam_policy.policy.*.arn, list("")), 0)}"
  description = "ARN of the policy. This should be attached to your app's IAM user."
}
