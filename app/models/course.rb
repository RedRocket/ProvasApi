class Course < ActiveRecord::Base
  before_save :convert_name, if: :name_changed?

  belongs_to :university
  has_many :subjects

  def convert_name
    self.name = I18n.transliterate(self.name).upcase
  end
end
