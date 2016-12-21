class ExamImage < ActiveRecord::Base
  belongs_to :exam
  mount_base64_uploader :image_uncompressed, PhotoUploader
  mount_uploader :image_black_and_white, PhotoUploader
  after_commit :process_image_black_and_white, on: [:create, :update]


  def process_image_black_and_white
    if previous_changes[:image_uncompressed]
      file_name = "#{Rails.root}/tmp/temp-#{self.id}.jpg"

      open(file_name, 'wb') do |file|
        file << open(self.image_uncompressed.url).read
      end

      image = OpenCV::Cv::Mat.new
      image = OpenCV::Cv::imread file_name

      OpenCV::Cv::cvtColor(image, image, OpenCV::Cv::COLOR_BGR2GRAY)

      size = OpenCV::Cv::Size.new(5,5)
      OpenCV::Cv::GaussianBlur(image, image, size, 0)
      OpenCV::Cv::adaptive_threshold(image, image, 251, OpenCV::CV_ADAPTIVE_THRESH_GAUSSIAN_C, OpenCV::CV_THRESH_BINARY, 19, 11)

      photo = OpenCV::Cv::imwrite "#{Rails.root}/tmp/black_and_white-#{self.id}.png", image

      file = File.open "#{Rails.root}/tmp/black_and_white-#{self.id}.png"

      self.image_black_and_white = file

      self.save
    end
  end
end
