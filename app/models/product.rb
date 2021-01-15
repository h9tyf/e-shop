class Product < ApplicationRecord
  belongs_to :shop

  has_many :carts
  has_many :favorites
  has_many :product_options
end
