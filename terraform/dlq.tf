resource "aws_sqs_queue" "order-payment-create-dlq" {
  name                       = "order-payment-create-dlq"
  message_retention_seconds  = 1209600
  max_message_size           = 262144
}

resource "aws_sqs_queue" "order-production-dlq" {
  name                       = "order-production-dlq"
  message_retention_seconds  = 1209600
  max_message_size           = 262144
}

resource "aws_sqs_queue" "payment-order-dlq" {
  name                       = "payment-order-dlq"
  message_retention_seconds  = 1209600
  max_message_size           = 262144
}

