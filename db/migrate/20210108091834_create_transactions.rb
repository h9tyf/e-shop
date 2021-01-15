class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :my_transactions do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
