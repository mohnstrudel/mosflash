class CreateMakets < ActiveRecord::Migration
  def change
    create_table :makets do |t|
      t.string :name
      t.string :attachment
      t.string :type
      t.belongs_to :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
