class ConversationsController < ApplicationController

	def new
		@conversation = Conversation.new
	end

	def create
		@conversation = Conversation.create(conversation_params)
		@conversation.trade_ended = false

		if @conversation.save
			redirect_to user_path(current_user)
		else
			redirect_to product_path(@conversation.product.id)
		end

	end

	def show
		@conversation = Conversation.find(params[:id])
		@product = @conversation.product
		@owner = @product.garden.user
		@message = Message.new
	end

	def destroy
		@conversation = Conversation.find(params[:id])
		@conversation.destroy
		redirect_to user_path(current_user)
	end


	private
	def conversation_params
		params.require(:conversation).permit(:product_id, :sender_id, :receiver_id, :request)
	end

end
