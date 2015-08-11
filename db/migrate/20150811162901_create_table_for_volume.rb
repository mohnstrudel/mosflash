class CreateTableForVolume < ActiveRecord::Migration
  def change
    create_table :volume do |t|
    	t.integer :value
    	t.timestamps null:false
    end
  
    create_table :voluminazation do |t|
    	t.belongs_to :product, index: true
    	t.belongs_to :volume, index: true
    	t.timestamps null: false
    end
  end
end
