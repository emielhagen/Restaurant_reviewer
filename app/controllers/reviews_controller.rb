class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.save!
    redirect_to restaurant_reviews_path(@review)
  end

private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
