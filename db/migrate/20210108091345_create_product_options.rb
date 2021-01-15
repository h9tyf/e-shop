class CreateProductOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_options do |t|
      t.string :description
      t.float :price
      t.references :product, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
