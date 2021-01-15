class Cart < ApplicationRecord
  #self.isSelected = false
  belongs_to :user
  belongs_to :product_option
end
