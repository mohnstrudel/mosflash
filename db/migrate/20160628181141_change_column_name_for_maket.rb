class ChangeColumnNameForMaket < ActiveRecord::Migration
  def change
  	rename_column :makets, :type, :maket_type
  end
end
