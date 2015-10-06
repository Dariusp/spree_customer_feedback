module Spree
  class ProductFeedback < ActiveRecord::Base
    belongs_to :product
    belongs_to :user
    belongs_to :order

    def average_rating
      ProductFeedback.where(:product_id=>self.product_id, :user_id=>self.user_id, :order_id=>self.order.id).average(:rating)
    end
  end
end
