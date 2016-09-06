class ProductsController < ApplicationController
  def index
    @products = Product.order('id Asc')
    # .limit(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    # プロダクト名にキーワード(検索ワード)が含まれるデータを20個まで抽出
    @products = Product.where('product_name LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

private
 def product_params
  params.require(:user).permit(:name, :skill_list, :interest_list)
 end


end
