class University < ActiveRecord::Base
  belongs_to :city
  has_many :courses
end
