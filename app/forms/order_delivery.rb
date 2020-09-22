class UserDonation

  include ActiveModel::Model
  attr_accessor :price, :token, :order_id, :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number
  with_options presence: true do
    validates :price
    validates :token
    validates :order_id
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block_number
    validates :building_name
    validates :phone_number
  end
end