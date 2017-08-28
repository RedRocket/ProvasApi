class State < ActiveRecord::Base
  before_save :convert_name, if: :name_changed?

  has_many :cities
  has_many :users

  #
  # Converting name to upcase and removing accent
  #
  def convert_name
    self.name = I18n.transliterate(self.name).upcase
  end
end
