class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find_by(token: params[:token])
    render json: @user.to_json(methods: [:exams_info])
  end

  #
  # Method for logging with Social Media
  # It checks if user exists, then update push token
  # Or create new user with its push token
  #
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

  #
  # Return group of exams from user
  #
  def my_exams
    @exams = User.find_by(id: params["id"]).exams

    render json: @exams.to_json(include: :subject), status: :ok
  end

  #
  # Return grup of favorite exams from user
  #
  def my_favorite_exams
    exams_id = Favorite.where(user_id: params["id"]).pluck(:exam_id)

    @exams = Exam.where(id: exams_id)

    render json: @exams.to_json(include: :subject), status: :ok
  end

  #
  # Method for logging with Email and Password
  # It checks if user exists, then update push token
  # Or create new user with its push token
  #
  def login_default
    @user = User.find_by email: user_params["email"], password: encrypt(user_params["password"])

    if @user == nil
      render json: { errors: "Email ou Senha invalidos" }, status: 422
    else
      if @user.blocked
        render json: { errors: "Conta bloqueada, entre em contato para solucionar" }, status: 422
      else
        @user.update(push_token: user_params["push_token"])
        render json: @user.to_json(include: :scores)
      end
    end
  end

  def update
    @user = User.find_by token: user_params["token"]

    if @user != nil
      if @user.update(user_params)
        render json: @user.to_json(), status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: {}, status: :ok
    end
  end

  #
  # Method for update users picture
  #
  def upload_picture
    @user = User.find_by token: user_params["token"]

    if @user != nil
      if @user.picture.url != nil
        @user.remove_picture!
        @user.save
      end

      @user.update(picture: params[:picture])

      render json: @user.to_json(), status: :created
    else
      render json: {}, status: :ok
    end
  end

  def create_default
    @user = User.new(user_params)

    @check_existing_user = User.unblocked.find_by email: @user.email, password: @user.password

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
    @user.send_recover_token()

    render json: {}.to_json()
  end

  def set_new_password
    @user = User.find_by(recover_password_token: params[:recover_password_token])

    if @user != nil
      @user.update(password: params[:password])
      render json: @user.to_json()
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def logout
    @user = User.find_by(token: params[:token])

    if @user
      @user.update(push_token: nil)
      render json: {}.to_json()
    else
      render json: {}.to_json()
    end
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
