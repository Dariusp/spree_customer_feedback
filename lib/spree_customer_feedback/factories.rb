FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_customer_feedback/factories'
  factory :feedback, class: Spree::Feedback do
    status 'open'
    order
    created_at 1.week.ago
  end
end
