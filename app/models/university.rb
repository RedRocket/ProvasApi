class University < ActiveRecord::Base
  belongs_to :city
  has_many :courses
  mount_uploader :header, PhotoUploader
end
