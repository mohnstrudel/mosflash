class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :facebook
      t.string :vk
      t.string :instagram
      t.string :youtube

      t.timestamps null: false
    end
  end
end
