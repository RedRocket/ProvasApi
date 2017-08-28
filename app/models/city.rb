class City < ActiveRecord::Base
  before_save :convert_name, if: :name_changed?

  belongs_to :state
  has_many :users
  has_many :universities

  #
  # Converting name to upcase and removing accent
  #
  def convert_name
    self.name = I18n.transliterate(self.name).upcase
  end
end
