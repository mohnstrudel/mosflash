class CreateColorizations < ActiveRecord::Migration
  def change

  	create_table :colors do |t|
  		t.string :value
  		t.timestamps null: false
  	end

  	add_column :products, :color, :string

    create_table :colorizations do |t|
    	t.belongs_to	:product, index: true
    	t.belongs_to	:color, index: true
    	t.timestamps null: false
    end
  end
end
