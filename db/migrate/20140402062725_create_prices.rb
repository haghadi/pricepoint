class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :product_id
      t.integer :store_id
      t.integer :price

      t.timestamps
    end
  end
end
