class Shop < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :solds
end
