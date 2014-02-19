require "spec_helper"
require 'benchmark'

describe Spree::Feedback do
  let(:feedback) {create(:feedback)}
  let(:order){create(:order)}

  context "after few days when created" do
    before{
      feedback.stub(:status){"open"}
      feedback.stub(:created_at){1.day.ago}
    }

    it "should send email when status open" do
      expect(feedback).to receive(:send_order_feedback)
      feedback.send_feedback
    end

    it "should don't send email when status sent" do
      feedback.stub(:status){"sent"}
      expect(feedback).should_not_receive(:send_order_feedback)
      feedback.send_feedback
    end

    it "should don't answer feedback before send" do
      feedback.answer_feedback
      expect(feedback.status).to eq "open"
    end

    it "should send order mail when order send_order_feedback" do
      feedback.stub(:order){order}
      expect(feedback.order).to receive(:send_feedback_mail)
      feedback.send_order_feedback
      expect(feedback.hash_url).to be
    end
  end

  context "save user review" do
    let(:product){create(:product)}

  end
end