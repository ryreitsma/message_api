require 'app/presenters/user'

module Presenters
  class Conversation < Grape::Entity
    expose :user, using: Presenters::User
    expose :links do |model| 
    [
      { rel: :self, href: "/conversations/#{model.id}"},
      { rel: :messages, href: "/conversations/#{model.id}/messages"}
    ]
    end
  end
end
    
