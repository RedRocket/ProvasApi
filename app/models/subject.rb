class Subject < ActiveRecord::Base
  before_save :convert_name, if: :name_changed?

  belongs_to :course
  has_many :exams

  def convert_name
    self.name = I18n.transliterate(self.name).upcase
  end
end
