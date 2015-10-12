class MessagesController < ApplicationController

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
    @message = Message.create(message_params)

    if @message.save
      redirect_to conversation_path(@message.conversation.id)
    else
      redirect_to conversation_path(@message.conversation.id)
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
    params.require(:message).permit(:content, :sender_id, :receiver_id, :conversation_id)
  end

end
