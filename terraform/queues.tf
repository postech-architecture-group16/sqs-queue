resource "rabbitmq_queue" "order_payment" {
  name = "order-payment"
  vhost = "foo"

  settings {
    durable = true
    auto_delete = false
  }
}

resource "rabbitmq_queue" "order_production" {
  name = "order-production"
  vhost = "foo"

  settings {
    durable = true
    auto_delete = false
  }
}

resource "rabbitmq_queue" "payment_order" {
  name = "payment-order"
  vhost = "foo"

  settings {
    durable = true
    auto_delete = false
  }
}