class ProductsController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    choose_search_method

    respond_to do |format|
      format.html
      format.js
    end
  end

  def choose_search_method
    search = params[:search]
    if params[:tag]
      @products = Product.find_by_tag(params[:tag])
    elsif params[:latitude] && params[:longitude] && search
      query = "LOWER(products.name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?) OR tags.name LIKE LOWER(?)"
      @products = Product.joins(:tags).where(query, "%#{search}%", "%#{search}%", "%#{search}%")
      @products = @products.near([params[:latitude], params[:longitude]], params[:proximity], units: :km)
    elsif !params[:latitude] && search
      query = "LOWER(products.name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?) OR tags.name LIKE LOWER(?)"
      @products = Product.joins(:tags).where(query, "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @products = Product.limit(10).order("RANDOM()")
    end
  end

  def show
    @product = Product.find(params[:id])
    @conversation = Conversation.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.garden = current_user.garden
    @product.postal_code = @product.garden.postal_code
    if @product.save
      redirect_to garden_path(@product.garden)
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

  def home
    @products = Product.limit(10).order("RANDOM()")
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :trade_info, :image, :tag_list)
  end
end

