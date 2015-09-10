class CreateServization < ActiveRecord::Migration
  def change
    create_table :servizations do |t|
    	t.belongs_to :product, index: true
    	t.belongs_to :addservice, index: true
    	t.float :coefficient
    	t.timestamps null: false
    end
  end
end
