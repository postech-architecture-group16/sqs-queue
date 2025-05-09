terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    rabbitmq = {
      source  = "cyrilgdn/rabbitmq"
      version = "~> 1.12.0" # Escolha a versão mais recente
    }
  }
  
  required_version = ">= 1.3.0"
}