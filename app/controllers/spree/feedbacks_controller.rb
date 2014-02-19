module Spree
  class FeedbacksController < StoreController
    def index
      @feedback = Feedback.find_by_hash_url(params[:hash])
    end

    def update
      @feedback = Feedback.find_by_hash_url params[:rate_feedback]
      if @feedback
        feedback_type = params[:rate_type]
        rate_product = Product.find_by_id(params[:rate_product])
        review = if params[:review].nil? then '' else params[:review] end
        rating = params[:rate_feedback]
        review = ProductFeedback.find_or_create(:order => @feedback.order, :user=>@feedback.order.user, :feedback_type=>feedback_type)
        review.update_attributes({:product => rate_product, :rating => rating, :review => review})
      end
      respond_to? do |format|
        format.json render json: review
        format.html render text: review.id.to_s
      end
    end
  end
end