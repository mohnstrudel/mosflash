class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.references :product
      t.string :size
      t.integer :weight
      t.string :material
      t.integer :price

      t.timestamps null: false
    end
  end
end
