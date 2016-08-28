class ProductsController < ApplicationController
  def index
    @products = Product.order('id Asc').limit(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = []
  end
end
