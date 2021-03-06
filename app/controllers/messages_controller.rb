class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user)
  end

  def new
    @message = Message.new
    @users = User.with_push_token
  end

  def new_filtered
    @states = State.all
    @universities = University.all
    @cities = City.all
  end

  #
  # Method to create filtered group of messages
  # Get exceptions in case of empty players array and in case of missing text
  #
  def create_filtered
    @users = User.with_push_token

    if(!params["state_id"].blank?)
      @users = @users.where(state_id: params["state_id"])
    end

    if(!params["university_id"].blank?)
      @users = @users.where(university_id: params["university_id"])
    end

    if(!params["city_id"].blank?)
      @users = @users.where(city_id: params["city_id"])
    end

    if @users.length > 0
      begin
        Message.send_pushes(@users, params["text"])
      rescue Exception => e
        if e.to_s.include? "You must include which players, segments, or tags you wish to send this notification to."
          redirect_to :back, notice: 'Nenhum dos usuários está com o App instalado'
        elsif e.to_s.include? "Notifications must have English language content"
          redirect_to :back, notice: 'Não esqueça de preencher a mensagem'
        else
          puts '>>>>'
          puts e.to_s
          puts "<<<<"

          redirect_to :back, notice: 'Erro ao enviar push notification'
        end
      else
        redirect_to messages_path, notice: 'Mensagens enviadas'
      end
    else
      redirect_to :back, notice: 'Nenhum usuário selecionado ou filtrado'
    end
  end

  #
  # Method send of Push Notifications to general
  # Get exceptions in case of empty players array and in case of missing text
  #
  def create
    if(params["selectAll"] != nil)
      @users = User.all
    else
      if params["users"] != nil
        ids = params["users"].collect {|key,value| key }
        @users = User.where(id: ids)
      else
        @users = []
      end
    end

    if @users.length > 0
      begin
        Message.send_pushes(@users, params["text"])
      rescue Exception => e
        if e.to_s.include? "You must include which players, segments, or tags you wish to send this notification to."
          redirect_to :back, notice: 'Nenhum dos usuários selecionados está com o App instalado'
        elsif e.to_s.include? "Notifications must have English language content"
          redirect_to :back, notice: 'Não esqueça de preencher a mensagem'
        else
          redirect_to :back, notice: 'Erro ao enviar push notification'
        end
      else
        redirect_to "/messages", notice: 'Mensagens enviadas'
      end
    else
      redirect_to :back, notice: 'Nenhum usuário selecionado ou filtrado'
    end
  end
end
