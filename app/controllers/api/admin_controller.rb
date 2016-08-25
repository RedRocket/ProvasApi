class Api::AdminController < ApplicationController

  def show
    @admin = Admin.first
    render json: @admin.to_json(:except => [:email, :password, :created_at, :updated_at, :id]), status: :ok
  end
end
