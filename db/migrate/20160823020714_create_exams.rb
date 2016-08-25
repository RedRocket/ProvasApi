class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :subject_id, index: true
      t.integer :user_id, index: true
      t.boolean :visible, default: true
      t.integer :views, default: 0
      t.float :period
      t.string :name
      t.float :feedback_avarage, default: 0

      t.timestamps null: false
    end
  end
end
