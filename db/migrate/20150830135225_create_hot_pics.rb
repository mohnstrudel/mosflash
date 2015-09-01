class CreateHotPics < ActiveRecord::Migration
  def change
    create_table :hot_pics do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
