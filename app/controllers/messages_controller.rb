class MessagesController < ApplicationController
  # before_filter :load_product

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    @reply = Message.new
  end

  def new
    @message = Message.new
  end

  def create


    @message = Message.create(message_params)
  
    if @message.save
      redirect_to user_path(current_user)
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
  def message_params
    params.require(:message).permit(:title, :content, :sender_id, :conversation_id)
  end

  # def load_product
  #   @product = Product.find(params[:product_id])
  # end
end
