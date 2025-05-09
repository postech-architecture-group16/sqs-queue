resource "aws_sqs_queue" "order-payment" {
  name                       = "order-payment"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 0
  max_message_size           = 262144
  receive_wait_time_seconds  = 0

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.order-payment-create-dlq.arn
    maxReceiveCount     = 5
  })

}

resource "aws_sqs_queue" "order-production" {
  name                       = "order-production"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 0
  max_message_size           = 262144
  receive_wait_time_seconds  = 0

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.order-production-dlq.arn
    maxReceiveCount     = 5
  })

}

resource "aws_sqs_queue" "payment-order" {
  name                       = "payment-order"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 0
  max_message_size           = 262144
  receive_wait_time_seconds  = 0

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.payment-order-dlq.arn
    maxReceiveCount     = 5
  })

}
