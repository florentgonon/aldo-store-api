class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :store, null: false, foreign_key: true
      t.references :shoe, null: false, foreign_key: true
      t.integer :stock

      t.timestamps
    end
  end
end
