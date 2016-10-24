class User < ActiveRecord::Base
  has_many :exams
  has_many :complaints
  has_many :requisitions
  has_many :scores

  belongs_to :university
  belongs_to :city
  belongs_to :state

  has_many :favorites
  mount_base64_uploader :picture, PhotoUploader
end
