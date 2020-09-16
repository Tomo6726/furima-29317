class Item < ApplicationRecord
  
  has_one_attached :image
  
  
  with_options presence: true  do
  validates :image
  validates :name
  validates :introduction
  validates :category_id
  validates :status_id
  validates :shipping_fee_id
  validates :prefecture_id
  validates :shipping_day_id
  validates :price
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Out of setting range" }
  validates :category_id, numericality: {other_than: 1, message: "Select" }
  validates :status_id, numericality: {other_than: 1, message: "Select" }
  validates :shipping_fee_id, numericality: {other_than: 1, message: "Select" }
  validates :prefecture_id,  numericality: { other_than: 1, message: "Select" }
  validates :shipping_day_id,numericality: { other_than: 1, message: "Select" }
end