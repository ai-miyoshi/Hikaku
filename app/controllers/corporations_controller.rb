class CorporationsController < ApplicationController
  def show
    @corporation = Corporation.find(params[:id])
    @product = Product.find(params[:id])
  end
end
