class AddRoomToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :room, :string
  end
end
