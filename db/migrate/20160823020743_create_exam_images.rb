class CreateExamImages < ActiveRecord::Migration
  def change
    create_table :exam_images do |t|
      t.text :image
      t.integer :exam_id, index: true

      t.timestamps null: false
    end
  end
end
