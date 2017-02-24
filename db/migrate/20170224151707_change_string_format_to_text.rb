class ChangeStringFormatToText < ActiveRecord::Migration
  def change
    change_column :user, :picture, :text
  end
end
