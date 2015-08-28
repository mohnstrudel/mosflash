class CreateAccompanships < ActiveRecord::Migration
  def change
    create_table :accompanships do |t|
      t.integer :product_id
      t.integer :accompany_id

      t.timestamps null: false
    end
  end
end
