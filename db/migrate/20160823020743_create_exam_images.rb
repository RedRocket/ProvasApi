class CreateExamImages < ActiveRecord::Migration
  def change
    create_table :exam_images do |t|
      t.text :image_uncompressed
      t.string :image_compressed
      t.string :image_black_and_white
      t.string :image_grey_scale
      t.string :image_enhenced
      t.integer :exam_id, index: true

      t.timestamps null: false
    end
  end
end
