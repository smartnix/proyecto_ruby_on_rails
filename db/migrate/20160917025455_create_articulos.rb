class CreateArticulos < ActiveRecord::Migration[5.0]
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.string :body
      t.integer :visits_count
      
      t.timestamps
    end
  end
end
