class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password
      t.float :price_per_km
      t.string :address
      t.float :tax

      t.timestamps null: false
    end
  end
end
