require "spec_helper"
require 'benchmark'

describe Spree::Shipment do
  let(:order) { create(:order) }
  let(:shipping_method) { create(:shipping_method, name: "UPS") }

  let(:variant) { mock_model(Spree::Variant) }
  context "Order shipped" do
    before {
      order.stub can_ship?: true
      order.stub backordered?: false
      order.stub canceled?: false
      order.stub currency: "USD"
      order.stub(:update!)
      shipment.stub(require_inventory: false, update_order: true, state: 'ready')
    }
    let(:shipment) do
      shipment = Spree::Shipment.new order: order
      shipment.stub shipping_method: shipping_method
      shipment.state = 'ready'
      shipment.cost = 1
      shipment.save
      shipment
    end
    it "should call register feedback after shipped" do
      shipment.stub(:send_shipped_email)
      shipment.stub(:update_order_shipment_state)
      shipment.stub(:after_ship)
      expect(shipment).to receive(:register_feedback)
      shipment.ship!
    end

    it "should call order send_feedback_mail after last shipment shipped" do
      shipment.stub(:send_shipped_email)
      shipment.stub(:update_order_shipment_state)
      shipment.stub(:after_ship)
      expect(Spree::Feedback).to receive(:create)
      shipment.ship!
    end
  end
end