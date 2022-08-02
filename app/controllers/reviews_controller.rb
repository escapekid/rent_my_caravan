class ReviewsController < ApplicationController
  before_action :set_caravan, only: [ :index, :new, :create ]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.caravan = Caravan.find(params[:caravan_id])
    @review.save
    redirect_to caravan_path(@caravan)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_caravan
    @caravan = Caravan.find(params[:caravan_id])
  end
end
