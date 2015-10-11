class TradesController < ApplicationController

  def new
    @product = Product.find(params[:product])
    @conversation = Conversation.find(params[:conversation])
    @buyer = User.find(params[:buyer])
    @trade = Trade.new
  end

  def index
    @trades_seller_success = Trade.where("seller_id = ? AND success = ?", current_user, true)
    @trades_seller_unsuccessful = Trade.where("seller_id = ? AND success = ?", current_user, false)
    @trades_buyer_success = Trade.where("buyer_id = ? AND success = ?", current_user, true)
    @trades_buyer_unsuccessful = Trade.where("buyer_id = ? AND success = ?", current_user, false)
  end

  def create
    @trade = Trade.create(trade_params)
    @trade.conversation.trade_id = @trade.id
    @trade.conversation.save
    if @trade.save
      redirect_to user_path(current_user)
    else
      render :new
    end

  end

  private
  def trade_params
    params.require(:trade).permit(:negotiation_result, :seller_id, :buyer_id, :product_id, :conversation_id, :success)
  end
  

end
