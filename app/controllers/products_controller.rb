class ProductsController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    search = params[:searchContent]

    if params[:latitude] && params[:longitude] && search
      # Search products by area and name
      # Method 1, search by location first and then refine search by name/description
      @products_by_proximity = find_products_in_proximity
      @products = []
      @products_by_proximity.each do |p|
        if (p.name.include?search)
          @products << p
        end
      end

      # Method 2, search by name/descriptionfirst and then refine search by location
      # @products_by_search = Product.where("LOWER(name) like LOWER(?) OR LOWER(description) LIKE LOWER(?)", "%#{search}%", "%#{search}%")
      # @products_by_search.each do |p|
      #   if p.garden.latitude  params[:latitude] && p.garden.
      # end

    elsif params[:latitude] && params[:longitude]
      # Search products by area
      find_products_in_proximity

    elsif params[:searchContent] && !params[:latitude]
      # Search products by name/description only
      @products = Product.where("LOWER(name) like LOWER(?) OR LOWER(description) LIKE LOWER(?)", "%#{search}%", "%#{search}%")
      # @products = Product.where("LOWER(name) like LOWER(?) OR LOWER(description) LIKE LOWER(?)", params[:searchContent], params[:searchContent])

    else
      @products = Product.all  
    end
  
    respond_to do |format|
      format.html
      format.js
    end

  end

  def find_products_in_proximity
    @gardens = Garden.near([params[:latitude], params[:longitude]], 10, units: :km)
    @products = []
    @gardens.each do |garden|
      garden.products.each do |p|
        @products << p
      end
    end

    return @products
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

