class AddSellpriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :sellprice, :float
  end
end
