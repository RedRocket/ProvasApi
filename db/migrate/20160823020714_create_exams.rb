class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :subject_id, index: true
      t.integer :user_id, index: true
      t.boolean :visible, default: false
      t.integer :views, default: 0
      t.float :period
      t.string :name
      t.string :professor_name
      t.float :feedback_avarage, default: -1
      t.boolean :processed_black_and_white, default: false
      t.boolean :processed_enhenced, default: false
      t.boolean :processed_grey_scale, default: false
      t.boolean :anonymous, default: false

      t.timestamps null: false
    end
  end
end
