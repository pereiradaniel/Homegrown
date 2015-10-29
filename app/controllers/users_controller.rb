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
      flash.now[:alert] = @user.errors.full_messages.first
      render :new
    end
  end

  def show
    @user = current_user
    @garden = Garden.new
  end

  def inbox
    @sent_conversations = Conversation.where("sender_id = ?", current_user.id)
    @received_conversations = Conversation.where("receiver_id = ?", current_user.id)
    @trades = Trade.where("seller_id = ?", current_user.id)
    @user = current_user

    # create a list of unique products
    @sent_products_list = Product.joins(:conversations).where("sender_id = ?", current_user.id).distinct
    @received_products_list = Product.joins(:conversations).where("receiver_id = ?", current_user.id).distinct
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
    @user = current_user
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
