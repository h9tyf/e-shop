class AddInformationToSold < ActiveRecord::Migration[6.0]
  def change
    add_column :solds, :address, :string
    add_column :solds, :phone, :string
  end
end
