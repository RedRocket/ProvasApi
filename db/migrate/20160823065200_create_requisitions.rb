class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
