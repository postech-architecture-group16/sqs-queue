resource "aws_mq_broker" "rabbitmq_broker" {
  broker_name         = "rabbitmq-broker"
  engine_type         = "RabbitMQ"
  engine_version      = "3.11.20"
  host_instance_type  = "mq.t3.micro"
  deployment_mode     = "SINGLE_INSTANCE"
  subnet_ids          = [module.vpc.public_subnets[0]]
  publicly_accessible = false
  configuration {
    id       = aws_mq_configuration.rabbitmq_broker_config.id
    revision = aws_mq_configuration.rabbitmq_broker_config.latest_revision
  }
  user {
    username = var.rabbit_mq_username
    password = var.rabbit_mq_password
  }

  auto_minor_version_upgrade = true
  maintenance_window_start_time {
    day_of_week = "MONDAY"
    time_of_day = "18:00"
    time_zone   = "UTC"
  }

  apply_immediately = true
}

resource "aws_mq_configuration" "rabbitmq_broker_config" {
  description    = "RabbitMQ config"
  name           = "rabbitmq-broker"
  engine_type    = "RabbitMQ"
  engine_version = "3.11.20"
  data           = <<DATA
# Default RabbitMQ delivery acknowledgement timeout is 30 minutes in milliseconds
consumer_timeout = 1800000
DATA
}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "2.77.0"
  name                 = "rabbit_mq_vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}