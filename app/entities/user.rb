module Entities
  class User < Grape::Entity
    expose :name
    expose :email
    expose :messages 
  end
end 
