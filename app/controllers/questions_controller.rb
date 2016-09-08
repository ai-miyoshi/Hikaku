class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @product = Product.find(params[:product_id])
  end

  def create
  Question.create(create_params)
  redirect_to controller: :products, action: :show, id: params[:product_id]
  end

private
  def create_params
    params.require(:question).permit(:text).merge(product_id: params[:product_id], user_id: current_user.id)
  end

end
