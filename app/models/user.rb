class User < ActiveRecord::Base
  has_many :exams
  has_many :complaints
  has_many :requisitions
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
end
