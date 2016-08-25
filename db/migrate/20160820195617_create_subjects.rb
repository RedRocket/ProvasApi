class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :course_id, index: true
      t.boolean :visible, default: true
      t.integer :exams_counter, default: 0

      t.timestamps null: false
    end
  end
end
