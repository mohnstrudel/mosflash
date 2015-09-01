class AddHotpicToProducts < ActiveRecord::Migration
  def change
    add_column :products, :hotpic, :string
  end
end
