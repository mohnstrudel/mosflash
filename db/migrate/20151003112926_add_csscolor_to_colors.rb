class AddCsscolorToColors < ActiveRecord::Migration
  def change
    add_column :colors, :csscolor, :string
  end
end
