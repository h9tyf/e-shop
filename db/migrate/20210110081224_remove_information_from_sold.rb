class RemoveInformationFromSold < ActiveRecord::Migration[6.0]
  def change
    remove_reference :solds, :shop, null: false, foreign_key: true
  end
end
