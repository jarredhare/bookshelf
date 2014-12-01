class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :user
      t.references :book

      t.timestamps
    end
  end
end
