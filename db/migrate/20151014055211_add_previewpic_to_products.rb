class AddPreviewpicToProducts < ActiveRecord::Migration
  def change
    add_column :products, :previewpic, :string
  end
end
