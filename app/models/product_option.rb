class ProductOption < ApplicationRecord
  belongs_to :product

  has_many :comments
  has_many :solds
  has_many :transaction_product_tables
end
