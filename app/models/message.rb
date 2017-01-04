class Message < ActiveRecord::Base
  def self.send_pushes(users, text)
    push_tokens = users.pluck(:push_token)

    @params = {
      contents: {"en": text },
      include_player_ids: push_tokens,
      app_id: "4ffe93f8-20b0-42ec-8668-f4408ce73545",
    };

    OneSignal::OneSignal.user_auth_key = "N2JkYTFlMjQtOWZkZS00NDljLWJmZmEtOWQ2NTUxNDY2MTBl"
    OneSignal::OneSignal.api_key = "OTcyNGY1MmItOTAzZC00ZmM4LTg1MTktYmYwY2NjNWJmZGU0"
    OneSignal::Notification.create(params: @params)

    users.each do |user|
      Message.create(user_id: user.id, text: text)
    end
  end
end
