class ShipOrderJob < ApplicationJob
  queue_as :default

  def perform(order)
    order.send_shipment_email
  end
end
