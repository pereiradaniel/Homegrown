class GardensController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]

  def index
    choose_search_method

    respond_to do |format|
      format.html
      format.js
    end
  end

  def choose_search_method
    if params[:latitude] && params[:longitude]
      @gardens = Garden.near([params[:latitude], params[:longitude]], params[:proximity], units: :km)
    elsif !params[:latitude]
      @gardens = Garden.all
    end
  end

  def show
    if params[:latitude]
      @lat = params[:latitude]
      @long = params[:longitude]
    end

    @garden = Garden.find(params[:id])
    @products = Garden.find(params[:id]).products
    @product = Product.new
    @user = @garden.user
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user

    if @garden.save
      redirect_to user_path(@current_user)
    else
      redirect_to user_path(@current_user)
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

  private
  def garden_params
    params.require(:garden).permit(:postal_code)
  end
end
