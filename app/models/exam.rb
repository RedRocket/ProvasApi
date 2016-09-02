class Exam < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :complaints
  has_many :exam_images
end