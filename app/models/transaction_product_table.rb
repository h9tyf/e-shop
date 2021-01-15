class TransactionProductTable < ApplicationRecord
  belongs_to :my_transaction
  belongs_to :product_option
end
