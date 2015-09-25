class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :position
      t.string :mail
      t.text :description
      t.text :calling
      t.text :cite

      t.timestamps null: false
    end
  end
end
