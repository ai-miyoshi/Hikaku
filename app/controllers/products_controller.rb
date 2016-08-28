class ProductsController < ApplicationController
  def index
    @products = Product.order('id Asc').limit(10)
  end

  def show
    @products = Product.new
  end

  def search
    @products = []
  end
end
