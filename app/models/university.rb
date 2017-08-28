class University < ActiveRecord::Base
  before_save :convert_name, if: :name_changed?

  belongs_to :city
  has_many :users
  has_many :courses

  mount_uploader :header, PhotoUploader

  #
  # Converting name to upcase and removing accent
  #
  def convert_name
    self.name = I18n.transliterate(self.name).upcase
  end
end
