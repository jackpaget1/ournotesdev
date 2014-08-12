class BasketItem < ActiveRecord::Base
	
	belongs_to :note
	belongs_to :basket
end
