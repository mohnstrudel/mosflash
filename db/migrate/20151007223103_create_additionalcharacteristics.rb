class CreateAdditionalcharacteristics < ActiveRecord::Migration
  def change
    create_table :additionalcharacteristics do |t|
      t.string :name
      t.string :value
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
