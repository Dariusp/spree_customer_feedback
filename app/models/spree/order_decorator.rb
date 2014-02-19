Spree::Order.class_eval do
  def send_feedback_mail feedback
    Spree::OrderMailer.feedback_email(feedback, self).deliver
  end
end