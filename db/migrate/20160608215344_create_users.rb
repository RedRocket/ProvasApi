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
      t.text :token
      t.text :recover_password_token
      t.text :password
      t.boolean :blocked, default: false

      t.integer :state_id, index: true
      t.integer :city_id, index: true
      t.integer :university_id, index: true
      t.integer :course_id, index: true

      t.timestamps null: false
    end
  end
end
