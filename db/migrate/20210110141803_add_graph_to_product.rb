class AddGraphToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :graph_link, :string
  end
end
