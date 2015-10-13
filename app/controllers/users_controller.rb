class UsersController < ApplicationController
  # skip_before_filter :require_login, only: [:new, :create]
  # before_filter :load_user, only: [:show, :destroy, :update, :edit]

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
    @trades = Trade.where("seller_id = ?", current_user.id)
    @user = current_user
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
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
