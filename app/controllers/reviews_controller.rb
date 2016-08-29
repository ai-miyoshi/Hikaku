class ReviewsController < ApplicationController
  # GET /reviews/new
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

end
