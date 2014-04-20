class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :storage
      t.integer :price
      t.string :color
      t.string :size

      t.timestamps
    end
  end
end
