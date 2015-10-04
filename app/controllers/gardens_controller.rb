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
    @user = User.find(params[:user_id])
    @garden = @user.garden.create(garden_params)
    if @garden.save 
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private
  def garden_params
    params.require(:user).permit(:user_id])
  end
end
