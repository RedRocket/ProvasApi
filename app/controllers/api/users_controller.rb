class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def login_sso
    @user = User.new(user_params)

    if(user_params[:picture] != nil)
      @user.remote_picture_url = user_params[:picture]
    end

    @check_existing_user = User.find_by token: @user.token, email: @user.email

    if @check_existing_user == nil
      if @user.save
        render json: @user.to_json(include: :scores), status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      @check_existing_user.update(push_token: user_params["push_token"])
      render json: @check_existing_user.to_json(include: :scores)
    end
  end

  def my_exams
    @exams = User.find_by(id: params["id"]).exams

    render json: @exams.to_json(include: :subject), status: :ok
  end

  def my_favorite_exams
    exams_id = Favorite.where(user_id: params["id"]).pluck(:exam_id)

    @exams = Exam.where(id: exams_id)

    render json: @exams.to_json(include: :subject), status: :ok
  end

  def login_default
    @user = User.find_by email: user_params["email"], password: encrypt(user_params["password"])

    if @user == nil
      render json: {}.to_json(), status: :unprocessable_entity
    else
      @user.update(push_token: user_params["push_token"])
      render json: @user.to_json(include: :scores)
    end
  end

  def update
    @user = User.find_by token: user_params["token"]

    if @user != null
      if @user.update(user_params)
        render json: @user.to_json(), status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: {}, status: :ok
    end
  end

  def create_default
    @user = User.new(user_params)
    @user.password = encrypt(user_params["password"])

    @check_existing_user = User.find_by email: @user.email, password: @user.password

    if @check_existing_user == nil
      @user.token = "common" + SecureRandom.hex(13)
      @user.save
      render json: @user.to_json()
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def set_recover_token
    @user = User.find_by(email: params[:email])

    @user.update(recover_password_token: (SecureRandom.random_number * 1000000).floor())

    render json: {}.to_json()
  end

  def set_new_password
    @user = User.find_by(recover_password_token: params[:recover_password_token])

    if @user != nil
      @user.update(password: encrypt(params[:password]))
      render json: @user.to_json()
    else
      render json: @user.errors, status: :unprocessable_entity
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
      params.permit(:push_token, :name, :birthday, :picture, :picture_large, :given_name, :family_name, :email, :phone, :token, :city_id, :state_id, :university_id, :password, :recover_password_token)
    end
end
