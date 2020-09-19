class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,  only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show, :edit]
  def index
    @item = Item.all.order("created_at DESC")
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
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:introduction,:category_id,:status_id,:shipping_fee_id,:prefecture_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
