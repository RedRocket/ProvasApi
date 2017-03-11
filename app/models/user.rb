class User < ActiveRecord::Base
  scope :unblocked, -> { where(blocked: false) }
  scope :with_push_token, -> { where.not(push_token: nil) }

  has_many :exams
  has_many :complaints
  has_many :requisitions
  has_many :messages
  has_many :scores

  belongs_to :university
  belongs_to :city
  belongs_to :state

  has_many :favorites
  mount_base64_uploader :picture, PhotoUploader

  before_save :create_hashed_password, if: :password_changed?

  def create_hashed_password
    self.password = password.crypt("ChaveDoProvas")
  end

  def send_recover_token
    UserMailer.recover_token(self).deliver_now
  end

  def total_views
    total_views = 0
    self.exams.each do |exam|
      total_views = total_views + exam.views
    end

    return total_views
  end

  def averege_scores
    averege_scores = 0
    exams = self.exams.where("feedback_avarage > 0")
    exams.each do |exam|
      averege_scores = averege_scores + exam.feedback_avarage
    end

    return (averege_scores/exams.count)
  end
end
