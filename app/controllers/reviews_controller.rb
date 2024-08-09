class ReviewsController < ApplicationController
    before_action :authenticate_shopper!  # Assuming Devise is used for authentication
  
    def create
      @boat = Boat.find(params[:boat_id])
      @review = @boat.reviews.build(review_params)
      @review.shopper = current_shopper  # Assuming Devise provides current_shopper
  
      if @review.save
        redirect_to @boat, notice: 'Your review was successfully posted.'
      else
        redirect_to @boat, alert: 'Error posting your review.'
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end