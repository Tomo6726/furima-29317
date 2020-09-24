class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
  belongs_to :user
	has_one :order

  has_one_attached :image
  
  
  with_options presence: true  do
  validates :image
  validates :name
  validates :introduction
  validates :category_id, numericality: {other_than: 1, message: "Select" }
  validates :status_id, numericality: {other_than: 1, message: "Select" }
  validates :shipping_fee_id, numericality: {other_than: 1, message: "Select" }
  validates :prefecture_id,  numericality: { other_than: 1, message: "Select" }
  validates :shipping_day_id,numericality: { other_than: 1, message: "Select" }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number"}
  end

  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Out of setting range" }
  
   
 
  
 
end
