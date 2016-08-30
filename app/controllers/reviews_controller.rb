class ReviewsController < ApplicationController
before_action :authenticate_user!, only: :new

  # GET /reviews/new
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    redirect_to controller: :products, action: :show, id: params[:product_id]

  end

private
  def create_params
    params.require(:review).permit(:rate, :use_period, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end

end
