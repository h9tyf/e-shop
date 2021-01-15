class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :product_option, null: false, foreign_key: { on_delete: :cascade }
      t.boolean :isSelected

      t.timestamps
    end
  end
end
