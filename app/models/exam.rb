class Exam < ActiveRecord::Base
  before_save :convert_name, if: :name_changed?

  belongs_to :subject
  belongs_to :user
  has_many :complaints
  has_many :exam_images
  has_many :scores

  has_many :favorites, dependent: :delete_all
  scope :visible, -> { where(visible: true) }

  #
  # Converting name to upcase and removing accent
  #
  def convert_name
    self.name = I18n.transliterate(self.name).upcase
  end

  #
  # Check if exam all images are in grey
  # Than update with status of process
  #
  def check_for_grey_scale
    checker = true
    self.exam_images.each do |image|
      if image.image_grey_scale == nil
        checker = false
      end
    end

    self.update(processed_grey_scale: checker)
  end


  #
  # Check if exam all images are in enhanced
  # Than update with status of process
  #
  def check_for_enhenced
    checker = true
    self.exam_images.each do |image|
      if image.image_enhenced == nil
        checker = false
      end
    end

    self.update(processed_enhenced: checker)
  end

  #
  # Check if exam all images are in black and white
  # Than update with status of process
  #
  def check_for_black_and_white
    checker = true
    self.exam_images.each do |image|
      if image.image_black_and_white == nil
        checker = false
      end
    end

    self.update(processed_black_and_white: checker)
  end
end
