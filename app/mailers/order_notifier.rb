class OrderNotifier < ApplicationMailer

  default from: 'order@mosflash.ru'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.mail, subject: 'Ваш заказ на сайте МосФлеш'

  end

  def notifyShop(order)
    @order = order
    mail to: 'a.kostin.09@gmail.com', subject: 'На сайте оставлен заказ'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
