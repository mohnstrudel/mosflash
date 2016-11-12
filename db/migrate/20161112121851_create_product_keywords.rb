class CreateProductKeywords < ActiveRecord::Migration
  def change
    create_table :product_keywords do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :keyword, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
