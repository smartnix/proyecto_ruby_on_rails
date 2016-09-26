class AddUserIdToArticulos < ActiveRecord::Migration[5.0]
  def change
    add_reference :articulos, :user, foreign_key: true
    add_foreign_key :articulos, :users
  end
end
