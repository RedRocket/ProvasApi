class UserMailer < ApplicationMailer
  default :from => 'contato@suaprova.com'

  def recover_token(user)
    @user = user
    mail(to: @user.email, subject: 'Recuperando sua Senha')
  end
end
