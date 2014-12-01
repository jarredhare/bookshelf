class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :img_url
      t.integer :isbn

      t.timestamps
    end
  end
end
