class AddOrderidToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :orderid, :integer
  end
end
