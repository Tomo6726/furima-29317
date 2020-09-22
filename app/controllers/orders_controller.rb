class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :return_to_index
  def index
  end
  
  def new
      
  end
   
  def create
  
   @order = Order.new(price: purchase_params[:price])
   if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
   else
      render 'index'
    end
  end

  
  private
   
  def order_params
    params.permit(:price, :token)
  end
   
  def pay_item
      Payjp.api_key = "sk_test_583657e63b35b72434935314"  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency:'jpy'                 # 通貨の種類(日本円)
      )
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :new
    end
  end
  def return_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end
   
end
