class ChangeTableNames < ActiveRecord::Migration
  def change
  	drop_table :volume
  
  	rename_table :voluminazation, :voluminazations
  end
end
