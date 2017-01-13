class Exam < ActiveRecord::Base
  before_save :convert_name, if: :name_changed?

  belongs_to :subject
  belongs_to :user
  has_many :complaints
  has_many :exam_images
  has_many :scores

  has_many :favorites
  scope :visible, -> { where(visible: true) }

  def convert_name
    self.name = I18n.transliterate(self.name).upcase
  end

  def check_for_grey_scale
    checker = true
    self.exam_images.each do |image|
      if image.image_grey_scale == nil
        checker = false
      end
    end

    self.update(processed_grey_scale: checker)
  end


  def check_for_enhenced
    checker = true
    self.exam_images.each do |image|
      if image.image_enhenced == nil
        checker = false
      end
    end

    self.update(processed_enhenced: checker)
  end

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
