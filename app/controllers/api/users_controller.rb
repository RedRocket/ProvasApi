class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show_or_create
    @user = User.new(user_params)
    @check_existing_user = User.find_by token: @user.token

    if @check_existing_user == nil
      if @user.save
        render json: @user.to_json(), status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      @check_existing_user.update(push_token: user_params["push_token"])
      render json: @check_existing_user.to_json()
    end
  end

  def logout
    @user = User.find_by(token: params[:token])
    @user.update(push_token: nil)

    render json: @user.to_json()
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(token: params[:token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:push_token, :name, :birthday, :picture, :picture_large, :given_name, :family_name, :email, :phone, :token)
    end
end
