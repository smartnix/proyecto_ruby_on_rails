class AddCoverToArticulos < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :articulos, :cover
  end
end
