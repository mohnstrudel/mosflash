class CreateAddservices < ActiveRecord::Migration
  def change
    create_table :addservices do |t|
      t.string :title
      t.float :price

      t.timestamps null: false
    end
  end
end
