class ConversationsController < ApplicationController

	def new
		@conversation = Conversation.new
	end

	def create
		@conversation = Conversation.new(conversation_params)
		@message = @conversation.messages.create(message_params)
	end

	def show
		@conversation = Conversation.find(params[:id])
		@message = Message.new
	end

	private
	def conversation_params
		params.require(:conversation).permit(:product_id, :sender_id, :receiver_id)
	end

	def message_params
		params.require(:message).permit(:title, :content)
	end

end
