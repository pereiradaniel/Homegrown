class MessagesController < ApplicationController
  before_filter :load_product

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end
  
  def new
    @message = Message.new
  end

  def create
    @message = @product.messages.build(message_params)
    @message.sender = current_user
    @message.receiver = @product.user
    if @message.save 
      redirect_to products_path
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
    params.require(:message).permit(:title, :content, :sender_id, :receiver_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
