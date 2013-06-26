module Presenters
  class User < Grape::Entity
    expose :name
    expose :email
    expose :links do |model| 
    [
      { rel: :self, href: "/users/#{model.id}"},
    ]
    end
  end
end 
