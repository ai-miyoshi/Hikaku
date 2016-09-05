class CorporationsController < ApplicationController

  def show
    @corporation = Corporation.find(params[:id])
    @product = Product.find(params[:id])
  end

  def index
    @corporations = Corporation.order('id Asc')
  end

end
