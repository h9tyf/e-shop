class Sold < ApplicationRecord
  belongs_to :product_option
  belongs_to :user
end
