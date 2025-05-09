provider "aws" {
  region = var.aws_region
}

provider "rabbitmq" {
  endpoint = "http://<rabbitmq-broker-endpoint>:15672" # Substitua pelo endpoint do broker
  username = var.rabbit_mq_username
  password = var.rabbit_mq_password

  depends_on = [aws_mq_broker.rabbitmq_broker]
}