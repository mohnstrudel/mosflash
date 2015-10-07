class DropAdditionalcharacteristicsTable < ActiveRecord::Migration
  def change
  	drop_table :additionalcharacteristics
  end
end
