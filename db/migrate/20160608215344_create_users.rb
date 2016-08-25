class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :given_name
      t.string :family_name
      t.string :name
      t.string :picture_large
      t.string :picture
      t.string :email
      t.string :phone
      t.string :birthday
      t.string :push_token
      t.text :token, default: 0
      t.boolean :blocked, default: false

      t.timestamps null: false
    end
  end
end
