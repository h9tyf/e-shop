class CreateTransactionProductTables < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_product_tables do |t|
      t.references :my_transaction, null: false, foreign_key: {on_delete: :cascade }
      t.references :product_option, null: false, foreign_key: { on_delete: :cascade }


      t.timestamps
    end
  end
end
