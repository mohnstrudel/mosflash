class AddOptionToOptionPics < ActiveRecord::Migration
  def change
    add_reference :option_pics, :option, index: true
    add_foreign_key :option_pics, :options
  end
end
