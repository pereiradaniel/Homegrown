class GardensController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]

  def index
    @gardens = Garden.all
  end

  def show
    @user = User.find(params[:user_id])
    @products = Garden.find(params[:id]).products
    @product = Product.new
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new
    @garden.user = current_user

    if @garden.save
      redirect_to user_garden_path(current_user, @garden)
    else
      render :new
    end
  end

  def destroy
    @garden = Garden.find(params[:id])

    @garden.products.each do |product|
      product.destroy
    end

    @garden.destroy
    redirect_to user_path(current_user)
  end
end
