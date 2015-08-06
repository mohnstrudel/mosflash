class AddTablesToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :advertising_text, :text
  	add_column :products, :fancy_quote, :text
  end
end
