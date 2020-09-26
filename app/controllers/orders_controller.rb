class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :return_to_index
  before_action :authenticate_user!, only:[:index]
  def index
    @order = OrderDelivery.new
  end
  
  def new
  end
  
  def create
   
   @order = OrderDelivery.new(order_delivery_params)
   if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
   else
      render 'index'
   end
  end
  
  private
   
  def order_delivery_params
    params.permit(:item_id, :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :token).merge(user_id: current_user.id)
  end
   
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_delivery_params[:token],    # カードトークン
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

    if (user_signed_in? && current_user.id == @item.user_id) || @item.order != nil
      
      redirect_to root_path 
    end
  end
end
