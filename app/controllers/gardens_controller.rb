class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @products = Garden.find(params[:id]).products
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new
    if @garden.save 
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

end
