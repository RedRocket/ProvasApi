class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :grade
      t.integer :exam_id
      t.text :text

      t.timestamps null: false
    end
  end
end
