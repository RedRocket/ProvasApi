class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.text :text
      t.integer :exam_id, index: true
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
