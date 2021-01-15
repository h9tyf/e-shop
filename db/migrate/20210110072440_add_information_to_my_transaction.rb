class AddInformationToMyTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :my_transactions, :address, :string
    add_column :my_transactions, :phone, :string
  end
end
