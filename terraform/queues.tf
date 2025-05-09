resource "rabbitmq_queue" "order-payment" {
  name = "order-payment"
  vhost = "foo"

  settings {
    durable = true
    auto_delete = false
  }
}

resource "rabbitmq_queue" "order-production" {
  name = "order-production"
  vhost = "foo"

  settings {
    durable = true
    auto_delete = false
  }
}

resource "rabbitmq_queue" "payment-order" {
  name = "payment-order"
  vhost = "foo"

  settings {
    durable = true
    auto_delete = false
  }
}