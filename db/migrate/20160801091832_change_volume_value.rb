class ChangeVolumeValue < ActiveRecord::Migration
  def change
  	change_column :volumes, :value, :float
  end
end
