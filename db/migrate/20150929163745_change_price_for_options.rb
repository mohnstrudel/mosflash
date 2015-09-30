class ChangePriceForOptions < ActiveRecord::Migration
  def change
  	change_column :options, :price,  :float
  end
end
