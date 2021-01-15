class AddAmountToSold < ActiveRecord::Migration[6.0]
  def change
    add_column :solds, :amount, :float
  end
end
