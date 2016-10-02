class ExamImage < ActiveRecord::Base
  belongs_to :exam
  mount_base64_uploader :image_uncompressed, PhotoUploader
end
