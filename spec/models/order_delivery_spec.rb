require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: @item.id)
    sleep(1)  # ActiveRecord::StatementInvalid: Mysql2::Error: MySQL client is not connectedというエラーを防ぐため
  end
  describe '商品を購入' do
    context '商品の購入がうまくいくとき' do

    it 'カード情報や有効期限、セキュリティコード、郵便番号、都道府県、市区町村、番地、電話番号が正しく入力されていれば購入できること' do
      
      expect(@order).to be_valid
    end
    it '郵便番号にハイフンが入っていれば購入できる' do
      
      @order.postal_code = "123-4567"
      expect(@order).to be_valid
    end
    it 'トークンが正しく入力されていれば購入できる' do
      
      @order.token = "testtoken"
      expect(@order).to be_valid
    end
  end
end


  context '商品の購入がうまくいかないとき' do
    it '郵便番号にハイフンが含まれていないと購入できない' do
      
      @order.postal_code = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code Input correctly")
    end
  
  
    it '配送先の都道府県が空だと購入できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture Select")
    end
    it '配送先の市町村が空だと購入できない' do
      
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '配送先の番地が空だと購入できない' do
      
      @order.block_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Block number can't be blank")
    end
  
    it '電話番号が空だと購入できない' do
      
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it  '電話番号にハイフンがあると購入できない' do
        @order.phone_number = '090-123-123'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
  
    it  '電話番号が12文字以上あると購入できない' do
      
      @order.phone_number = "090123456789"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it 'トークンが空だと購入できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end 
   
  
end
