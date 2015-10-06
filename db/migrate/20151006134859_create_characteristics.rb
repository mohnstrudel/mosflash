class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.float :weight
      t.float :length
      t.float :width
      t.float :thickness
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
