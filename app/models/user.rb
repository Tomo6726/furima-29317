class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
	has_many :orders
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: " Include both letters and numbers"}
  
  with_options presence: true do 
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"} 
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"} 
    validates :nickname
    validates :birth_day
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: " Full-width katakana characters"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: " Full-width katakana characters"}
  end

end
