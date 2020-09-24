class OrderDelivery

  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :token, :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number
  with_options presence: true do
    validates :token, format: {with:  /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})\z/}
    validates :user_id
    validates :item_id
    
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postal code Input correctly"}
    validates :prefecture_id,  numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :block_number
    
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number )
  end
end