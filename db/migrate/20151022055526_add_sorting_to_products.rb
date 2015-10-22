class AddSortingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sorting, :integer
  end
end
