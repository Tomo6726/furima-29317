class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!
  
  def index
    #@item = Item.all
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

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :introduction,
      :category_id,
      :status_id,
      :shipping_fee_id,
      :prefecture_id,
      :shipping_day_id,
      :price
      )
  end
end
