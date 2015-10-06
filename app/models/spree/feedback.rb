module Spree
  class Feedback < ActiveRecord::Base
    belongs_to :order

    state_machine :status, :initial => :open do
      event :send_feedback do
        transition [:open] => :sent
      end
      event :close_feedback do
        transition [:sent] => :closed
      end
      event :answer_feedback do
        transition [:sent] => :answered
      end

      after_transition :on => :send_feedback, :do => :send_order_feedback
    end


    def self.run
      Feedback.all.each do |f|
        f.send_feedback unless f.created_at >= 1.week.ago
        f.close_feedback unless f.created_at >= 3.week.ago
      end
    end

    def send_order_feedback
      self.hash_url = SecureRandom.uuid
      order.send_feedback_mail self
      save
    end
  end
end