class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart

  has_many :comments
  has_many :favorites
  has_many :shops
  has_many :solds
  has_many :my_transactions

end
