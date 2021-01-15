class MyTransaction < ApplicationRecord
  belongs_to :user

  has_many :transaction_product_tables
end
