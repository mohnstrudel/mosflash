class AddTopartyToAddservices < ActiveRecord::Migration
  def change
    add_column :addservices, :toparty, :boolean
  end
end
