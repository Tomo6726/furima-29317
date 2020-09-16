require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image =  fixture_file_upload('test_image.png', 'image/png')
  end
  # after(:build) do |post|
  #   post.image.attach(io: File.open('public/images/test_image.png'),  filename: 'test_image_png')
  # end

  describe '商品の情報を入力' do
    context '商品出品がうまくいくとき' do
    
      it  "imageとname、introduction、price、category_id、status_id、shipping_fee_id、prefecture_id、shipping_day_idが存在すれば出品できる" do
        expect(@item).to be_valid
      end

      it  "商品名が40文字以下であれば出品できる" do
        @item.name = "お芋"
        expect(@item).to be_valid
      end
      
      it  "商品の説明が1000文字以下であれば出品できる" do
        @item.introduction = "とても美味しい"
        expect(@item).to be_valid
      end
      it  "価格が300円以上9_999_999円以下であれば出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
  
    
    context '商品出品がうまくいかないとき' do

      it  "出品画像が添付されていないと出品できない" do
        @item.image = nil
       
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
      it  "商品名が空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it  "商品の説明が空だと出品できない" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it  "カテゴリーが空だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it  "商品の状態が空だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it  "配送料の負担が空だと出品できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Select")
      end
      it  "発送元の地域が空だと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it  "発送までの日数が空だと出品できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day Select")
      end
      it  "価格が空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it  "価格が300円以上9_999_999円以下の範囲外であれば出品できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it  "価格が半角数字のみでなければ出品できない" do
        @item.price = "300a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    
  end
end