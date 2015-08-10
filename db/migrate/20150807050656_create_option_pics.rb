class CreateOptionPics < ActiveRecord::Migration
  def change
    create_table :option_pics do |t|
      t.string :image_url

      t.timestamps null: false
    end
  end
end
