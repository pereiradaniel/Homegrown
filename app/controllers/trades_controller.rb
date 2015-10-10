class TradesController < ApplicationController

  def new
    @product = Product.find(params[:product])
    @conversation = Conversation.find(params[:conversation])
    @buyer = User.find(params[:buyer])
    @trade = Trade.new
  end

  def create
    @trade = Trade.create(trade_params)

    if @trade.save
      redirect_to user_path(current_user)
    else
      render :new
    end

  end

  private
  def trade_params
    params.require(:trade).permit(:negotiation_result, :seller_id, :buyer_id, :product_id, :conversation_id)
  end
  

end
