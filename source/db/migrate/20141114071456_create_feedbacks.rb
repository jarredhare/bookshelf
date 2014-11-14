class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.belongs_to :user
      t.belongs_to :workout
      t.string :feedback
      t.date :date
      t.timestamps
    end
  end
end
