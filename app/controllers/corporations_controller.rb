class CorporationsController < ApplicationController

  def show
    @corporation = Corporation.find(params[:id])
  end

  def index
    @corporations = Corporation.order('id Asc')
  end

end
