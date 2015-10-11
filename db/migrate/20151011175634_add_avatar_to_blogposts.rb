class AddAvatarToBlogposts < ActiveRecord::Migration
  def change
    add_column :blogposts, :avatar, :string
  end
end
