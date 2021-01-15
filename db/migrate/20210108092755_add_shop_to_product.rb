class AddShopToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :shop, null: false, foreign_key: { on_delete: :cascade }
  end
end
