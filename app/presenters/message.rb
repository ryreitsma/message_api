require 'app/presenters/user'

module Presenters
  class Message < Grape::Entity
    expose :content
    expose :user, using: Presenters::User
    expose :links do |model| 
    [
      { rel: :self, href: "/conversations/#{model.conversation_id}/message/#{model.id}"},
      { rel: :conversation, href: "/conversations/#{model.conversation_id}"}
    ]
    end
  end
end
