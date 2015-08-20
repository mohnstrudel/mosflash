class AddBuildingToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :building, :string
    add_column :orders, :fathername, :string
  end
end
