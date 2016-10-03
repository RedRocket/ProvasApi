class User < ActiveRecord::Base
  has_many :exams
  has_many :complaints
  has_many :requisitions

  belongs_to :university
  belongs_to :city
  belongs_to :state

  has_many :favorites
  mount_uploader :picture, PhotoUploader
end
