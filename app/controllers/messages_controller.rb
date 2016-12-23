class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @users = User.all
  end

  def new_filtered
    @states = State.all
    @universities = University.all
    @cities = City.all
  end

  def create_filtered
    @users = User.all

    if(params["state_id"] != nil)
      @users = @users.where(state_id: params["state_id"])
    end

    if(params["university_id"] != nil)
      @users = @users.where(university_id: params["university_id"])
    end

    if(params["city_id"] != nil)
      @users = @users.where(city_id: params["city_id"])
    end

    send_pushes(@users)
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

    send_pushes(@users)
  end

  private
    def send_pushes(users)
      if users.length > 0
        push_tokens = users.pluck(:push_token)

        @params = {
          contents: {"en": params["text"] },
          include_player_ids: push_tokens,
          app_id: "4ffe93f8-20b0-42ec-8668-f4408ce73545",
        };

        begin
          OneSignal::OneSignal.user_auth_key = "N2JkYTFlMjQtOWZkZS00NDljLWJmZmEtOWQ2NTUxNDY2MTBl"
          OneSignal::OneSignal.api_key = "OTcyNGY1MmItOTAzZC00ZmM4LTg1MTktYmYwY2NjNWJmZGU0"
          OneSignal::Notification.create(params: @params)

          users.each do |user|
            Message.create(user_id: user.id, text: params["text"])
          end
        rescue Exception => e
          redirect_to :back, notice: 'Não esqueça de preencher a mensagem'
        end
      else
        redirect_to :back, notice: 'Nenhum usuário selecionado ou filtrado'
      end
    end
end
