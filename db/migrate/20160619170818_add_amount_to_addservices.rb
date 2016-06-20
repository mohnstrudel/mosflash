class AddAmountToAddservices < ActiveRecord::Migration
  def change
    add_column :addservices, :amount_name, :string
    add_column :addservices, :amount, :integer
  end
end
