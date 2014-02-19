Spree::Shipment.class_eval do
  state_machine do
    after_transition :to=>:shipped, :do=>:register_feedback
  end

  def register_feedback
    if order.shipments.shipped.count == order.shipments.count
      Spree::Feedback.create(:order=>order)
    end
  end

end