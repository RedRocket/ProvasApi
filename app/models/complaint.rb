class Complaint < ActiveRecord::Base
  belongs_to :exam
  belongs_to :user
end
