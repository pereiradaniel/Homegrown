class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @garden = Garden.new
    @conversations = Conversation.where("receiver_id = ? OR sender_id = ?", current_user.id, current_user.id)
    @sent_conversations = Conversation.where("sender_id = ?", current_user.id)
    @received_conversations = Conversation.where("receiver_id = ?", current_user.id)
    @trades = Trade.where("seller_id = ?", current_user.id)
    @user = current_user

    # create a list of products that belong to products in @conversations
    @sent_products_list = @sent_conversations.select(:product_id).distinct
    @received_products_list = @received_conversations.select(:product_id).distinct
    @products_list = @conversations.select(:product_id).distinct
    @products_list = @products_list.page(params[:page]).per(5)
  end

  def destroy
    logout
    @user.garden.products.each do |product|
      product.destroy
    end
    @user.garden.destroy
    @user.destroy

    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end
