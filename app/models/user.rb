class User < ActiveRecord::Base
  scope :unblocked, -> { where(blocked: false) }
  scope :with_push_token, -> { where("push_token <> ''") }

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

  #
  # Method to encrypt password
  #
  def create_hashed_password
    self.password = password.crypt("ChaveDoProvas")
  end

  def send_recover_token
    UserMailer.recover_token(self).deliver_now
  end

  #
  # Method to group info of user
  #
  def exams_info
    averege_scores = 0
    exams_accounted_scores = 0
    total_views = 0
    self.exams.each do |exam|
      total_views = total_views + exam.views

      if exam.feedback_avarage >= 0
        averege_scores = averege_scores + exam.feedback_avarage
        exams_accounted_scores = exams_accounted_scores + 1
      end
    end

    if exams_accounted_scores > 0
      averege_scores = averege_scores / exams_accounted_scores
    end

    return {averege_scores: averege_scores, total_views: total_views}
  end
end
