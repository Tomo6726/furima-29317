class ItemsController < ApplicationController
  # protect_from_forgery :except => [:create]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new
   end
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:introduction,:category_id,:status_id,:shipping_fee_id,:prefecture_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end
end
