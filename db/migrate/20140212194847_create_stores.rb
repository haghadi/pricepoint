class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :storeName
      t.string :address
      t.belongs_to :user

      t.timestamps
    end
  end
end
