class Api::InformationController < ApplicationController
  def dashboard
    @users = User.all
  end
end
