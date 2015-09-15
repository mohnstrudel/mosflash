class AddDataToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :addservices, :hstore
  end
end
