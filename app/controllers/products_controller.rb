class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @message = Message.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.garden = current_user.garden
    if @product.save
      redirect_to user_garden_path(current_user, current_user.garden)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :trade_info)
  end
end

