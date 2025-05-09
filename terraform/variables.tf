variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "AWS Account Region"
}

variable "rabbit_mq_username" {
  type = string
  default = "guest"
  description = "RabbitMQ username"
  sensitive = true
}


variable "rabbit_mq_password" {
  type = string
  default = "guest"
  description = "RabbitMQ password"
  sensitive = true
}