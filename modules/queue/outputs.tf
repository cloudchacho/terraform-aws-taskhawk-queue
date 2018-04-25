output "sqs_queue_arn" {
  value = "${aws_sqs_queue.sqs_queue.arn}"
}

output "sqs_queue_url" {
  value = "${aws_sqs_queue.sqs_queue.id}"
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
