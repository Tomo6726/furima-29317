class Purchase < ApplicationRecord
  belongs to :user
	belongs to :item
	has_one :delivery address
end
