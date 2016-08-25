class ApplicationController < ActionController::Base
  def encrypt(string)
  	return string.crypt("ChaveDoProvas")
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end


  def check_and_redirect_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    if @current_admin == nil
      redirect_to "/admin", :notice => "Por favor faça o seu login"
    end
  end
end
