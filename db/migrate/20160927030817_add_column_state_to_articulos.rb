class AddColumnStateToArticulos < ActiveRecord::Migration[5.0]
  def change
    add_column :articulos, :state, :string, default: "in_draft"
  end
end
