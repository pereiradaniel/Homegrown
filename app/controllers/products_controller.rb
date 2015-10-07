class ProductsController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    search = params[:search]
    if search
      @products = Product.where("LOWER(name) like LOWER(?) OR LOWER(description) LIKE LOWER(?)", "%#{search}%", "%#{search}%")
    else
      @products = Product.all
    end
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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :trade_info, :image, :tag_list)
  end
end

