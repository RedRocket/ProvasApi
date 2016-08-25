class Subject < ActiveRecord::Base
  belongs_to :course
  has_many :exams
end
