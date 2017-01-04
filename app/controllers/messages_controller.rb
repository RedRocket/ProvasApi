class MessagesController < ApplicationController
  def index
    @messages = Message.all
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

  def create_filtered
    @users = User.with_push_token

    if(params["state_id"] != nil)
      @users = @users.where(state_id: params["state_id"])
    end

    if(params["university_id"] != nil)
      @users = @users.where(university_id: params["university_id"])
    end

    if(params["city_id"] != nil)
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
          puts '?>>>>>>'
          puts e
          puts "<<<<<<"
        end
      else
        redirect_to messages_path, notice: 'Mensagens enviadas'
      end
    else
      redirect_to :back, notice: 'Nenhum usuário selecionado ou filtrado'
    end
  end

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
        end
      else
        redirect_to "/messages", notice: 'Mensagens enviadas'
      end
    else
      redirect_to :back, notice: 'Nenhum usuário selecionado ou filtrado'
    end
  end
end
