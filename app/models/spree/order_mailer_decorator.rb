Spree::OrderMailer.class_eval do
  def feedback_email(feedback, order ,resend = false)
    @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
    @feedback = feedback
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{Spree.t('order_mailer.feedback_email.subject')} ##{@order.number}"
    mail(to: @order.email, from: from_address, subject: subject)
  end
end