class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.text :leadparagraph

      t.timestamps null: false
    end
  end
end
