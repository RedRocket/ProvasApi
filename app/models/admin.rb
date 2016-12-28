class Admin < ActiveRecord::Base
  before_save :create_hashed_password, if: :password_changed?

  def create_hashed_password
    self.password = password.crypt("ChaveDoProvas")
  end
end
