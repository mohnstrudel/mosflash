class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
