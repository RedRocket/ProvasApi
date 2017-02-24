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
  before_save :delete_old_profile, if: :picture_changed?


  def delete_old_file
    self.remove_picture!
  end

  def create_hashed_password
    self.password = password.crypt("ChaveDoProvas")
  end

  def send_recover_token
    UserMailer.recover_token(self).deliver_now
  end
end
