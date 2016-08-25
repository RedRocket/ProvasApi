class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.integer :city_id, index: true
      t.boolean :visible, default: true
      t.integer :views, default: 0
      t.string :header

      t.timestamps null: false
    end
  end
end
