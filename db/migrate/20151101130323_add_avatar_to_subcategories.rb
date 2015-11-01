class AddAvatarToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :avatar, :string
  end
end
