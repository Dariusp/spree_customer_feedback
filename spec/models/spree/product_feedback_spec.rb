require 'spec_helper'

describe Spree::ProductFeedback do
  let(:order) {create(:order)}
  let(:user) {create(:user)}
  let(:product) {create(:product)}
  context "When feedback created" do
    before{
      Spree::ProductFeedback.create(:order_id => order.id, :user_id => user.id, :product_id=>product.id, feedback_type: :shipping_rate, rating: 5)
      Spree::ProductFeedback.create(:order_id => order.id, :user_id => user.id, :product_id=>product.id, feedback_type: :description_rate, rating: 1)
      Spree::ProductFeedback.create(:order_id => order.id, :user_id => user.id, :product_id=>product.id, feedback_type: :quality_rate, rating: 3)
    }
    it "should calculate product_review rating to 3" do
      rev = Spree::ProductFeedback.create(:order_id => order.id, :user_id => user.id, :product_id=>product.id, feedback_type: :product_review, rating: 3)
      expect(rev.average_rating).to eq 3
    end
  end
end
