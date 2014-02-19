module Spree
  class ProductFeedback < ActiveRecord::Base
    belongs_to :product
    belongs_to :user
    belongs_to :order

    after_save :calculate_review_rating

    def calculate_review_rating
      prod = ProductFeedback.where(:product_id=>self.product_id, :user_id=>self.user_id, :order_id=>self.order.id)
      rating = prod.where("spree_product_feedbacks.feedback_type!='product_review'").average(:rating)
      prod.where(:feedback_type=>'product_review').update_all(:rating=>rating)
      if self.feedback_type=='product_review'
          self.rating = rating
      end
    end
  end
end
