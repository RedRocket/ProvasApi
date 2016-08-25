class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def new
  end

  def create
  	admin = Admin.find_by password: encrypt(params[:password]), email: params[:email]
    if admin != nil
	    session[:admin_id] = admin.id
	    redirect_to dashboard_path, :notice => "Bem Vindo"
    else
    	redirect_to :back, :alert => "Senha ou E-mail inválido"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to "/", :alert => "Log out com sucesso"
  end
end
