class CreateSolds < ActiveRecord::Migration[6.0]
  def change
    create_table :solds do |t|
      t.references :shop, null: false, foreign_key: { on_delete: :cascade }
      t.references :productOption, null: false, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
